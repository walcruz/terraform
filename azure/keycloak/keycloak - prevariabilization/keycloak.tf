## PROVIDERS
terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.0.1"
    }
  }
}

## DATA
data "keycloak_realm" "admin_realm" {
  realm = "master"
}

data "keycloak_openid_client" "realm_management" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = "realm-management"
}

data "azurerm_resource_group" "keycloak" {
  name = "rg_name"
}

data "azurerm_key_vault" "keycloak" {
  name                = "kv_name"
  resource_group_name = data.azurerm_resource_group.keycloak.name
}

data "azuread_application" "keycloak" {
  display_name = length(var.environ) > 0 ? "keycloak-${var.environ}" : "keycloak"
}

data "keycloak_role" "offline_access" {
  realm_id = keycloak_realm.appname_realm.id
  name     = "role_create-client"
}

#Data of each client role from realm-management
data "keycloak_role" "each_realmcr" {
  for_each  = toset(var.realm_management_crole)
  realm_id  = keycloak_realm.appname_realm.id
  client_id = data.keycloak_openid_client.realm_management.id

  name = each.value
}

#Pass to idp login
data "azurerm_key_vault_secret" "keycloak" {
  key_vault_id = data.azurerm_key_vault.keycloak.id
  name         = var.kv_name_client_secret
}

#script-mapper file
data "template_file" "script_mapper" {
  template = file("../../modules/keycloak/files/scriptMapper.java")
}

## RESORUCES - KEYCLOAK
resource "keycloak_realm" "appname_realm" {
  realm             = "appname"
  enabled           = true
  display_name      = "appname"
  display_name_html = "<b>appname</b>"
}

resource "keycloak_user" "admin_appname" {
  realm_id = keycloak_realm.appname_realm.id
  username = "admin"
  enabled  = true
  attributes = {
    invited = "true"
  }

}

resource "keycloak_role" "appname_realm_role" {
  realm_id        = keycloak_realm.appname_realm.id
  client_id       = keycloak_openid_client.openid_client.id
  name            = "admin"
  description     = "appname admin realm role"
  composite_roles = [for i in var.realm_management_crole : data.keycloak_role.each_realmcr[i].id]
}

resource "keycloak_openid_client" "openid_client" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = "client_name"

  name    = "Client_name"
  enabled = true


  access_type = "CONFIDENTIAL"
  /* valid_redirect_uris = [
    "http://localhost:8080"
    #"https://portal.dev.smartot.eu"
  ] */
  service_accounts_enabled = true
  authorization {
    policy_enforcement_mode = "ENFORCING"
  }

  login_theme = "keycloak"

  #Omited to autogenerate by keycloak
  #client_secret = 
  #client_authenticator_type = "client-secret" #default
}

resource "keycloak_openid_client_service_account_realm_role" "client_service_account_role" {
  realm_id                = keycloak_realm.appname_realm.id
  service_account_user_id = keycloak_openid_client.openid_client.service_account_user_id
  role                    = keycloak_role.appname_realm_role.name
}

#IDP ADMIN REALM
resource "keycloak_oidc_identity_provider" "realm_identity_provider" {
  realm             = data.keycloak_realm.admin_realm.id
  alias             = "appname"
  authorization_url = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize"
  client_id         = data.azuread_application.keycloak.application_id
  client_secret     = data.azurerm_key_vault_secret.keycloak.value
  token_url         = "https://login.microsoftonline.com/common/oauth2/v2.0/token"
  default_scopes    = "openid email profile"

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
    "prompt"           = "login"
  }
}

#AZURE VAULT - store secret

resource "azurerm_key_vault_secret" "keycloak" {
  name         = "app-keycloak-client-secret"
  value        = keycloak_openid_client.openid_client.client_secret
  key_vault_id = data.azurerm_key_vault.keycloak.id

  depends_on = [keycloak_openid_client.openid_client]
}


resource "keycloak_custom_identity_provider_mapper" "koidc" {
  realm                    = keycloak_realm.appname_realm.id
  name                     = "group_roles"
  identity_provider_alias  = keycloak_oidc_identity_provider.realm_identity_provider.alias
  identity_provider_mapper = "%s-user-attribute-idp-mapper"

  # extra_config with syncMode is required in Keycloak 10+
  extra_config = {
    syncMode      = "INHERIT"
    Claim         = "my-email-claim"
    UserAttribute = "email"
  }
}

resource "keycloak_openid_script_protocol_mapper" "scoped_roles" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = keycloak_openid_client.openid_client.id
  name      = "Scoped Roles"

  claim_name       = "scoped_roles"
  script           = data.template_file.script_mapper.rendered
  claim_value_type = "JSON"
  add_to_userinfo  = false
}

#Protocol to Invited
resource "keycloak_openid_user_attribute_protocol_mapper" "invited" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = keycloak_openid_client.openid_client.id
  name      = "User Attribute (is Invited)"

  user_attribute   = "isinvited"
  claim_name       = "isinvited"
  claim_value_type = "JSON"
}

#Protocol to SA
resource "keycloak_openid_user_attribute_protocol_mapper" "sa" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = keycloak_openid_client.openid_client.id
  name      = "User Attribute (is Service Account)"

  user_attribute   = "isServiceAccount"
  claim_name       = "isServiceAccount"
  claim_value_type = "JSON"
}

#Realm Roles
resource "keycloak_role" "role_cp_admin" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "cp:admin"
  description = "Cloud Portal Administrator Role: has access to all opreations within assigned tenant, security and device groups"
}

resource "keycloak_role" "role_cp_contributor" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "cp:contributor"
  description = "Cloud Portal Contributor Role"
}

resource "keycloak_role" "role_cp_reader" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "cp:reader"
  description = "Cloud Portal Reader Role"
}

resource "keycloak_role" "role_efa_admin" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "efa:admin"
  description = "EFA (Edge Fleet Administrator) Admin Role"
}

resource "keycloak_role" "role_efa_contributor" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "efa:contributor"
  description = "EFA (Edge Fleet Administrator) Contributor Role"
}

resource "keycloak_role" "role_efa_reader" {
  realm_id    = keycloak_realm.appname_realm.id
  name        = "efa:reader"
  description = "EFA (Edge Fleet Administrator) Reader Role"
}