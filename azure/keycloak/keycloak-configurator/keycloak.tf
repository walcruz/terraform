data "keycloak_openid_client" "realm_management" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = "realm-management"
}


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
  realm_id = keycloak_realm.appname_realm.id
  #client_id   = data.keycloak_openid_client.realm_management.id
  name        = "admin"
  description = "appname admin realm role"

  composite_roles = [
    "c308280d-59a2-4a24-917a-9a1fdce7c4d4",
    "5e436967-d106-4c8b-9e18-4018c5977243",
    "c388d195-61f5-4179-8fbc-464246300c5b",
    "da0eb936-ffef-4851-8818-c0d5656cc84b",
    "67267261-7344-41b0-aacf-ad3b15f3be16",
    "029f6933-05b6-4bd1-b301-9cbb41f5981c",
    "e1ad842f-81da-41c1-ab46-bc8cd6e88503",
    "2a6cf1f3-ab12-4e13-9ac0-85f581cae0e7",
    "3bbfdcf3-1269-42fc-818d-e4e333665e61",
    "de14d066-526c-42fc-8a0e-c70038dba7dc",
    "20b54c6b-5de6-462a-af0d-6cd3c4a4c705",
    "b08e4225-377a-4f8e-97b1-cc52e5231d7b",
    "de5b06e2-ab74-47bc-a240-b6fa99529b0b",
    "16f1791d-db18-486a-96a0-46f4ddd43099",
    "87d545d7-086a-454e-9823-0ec8c0d2e1ae",
    "f2452536-f944-46a6-8c95-50258a5733bd",
    "b1bb6db4-1858-4759-bbcd-2e5da1f8e3f9",
    "373839d3-dcbb-4de3-82aa-6a67f0cb6075",
    "9d5ac78b-fb9d-4eb2-8da2-f97e392e4787"
  ]
}


resource "keycloak_openid_client" "openid_client" {
  realm_id  = keycloak_realm.appname_realm.id
  client_id = "client_name"

  name    = "client_name"
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

data "azurerm_resource_group" "example" {
  name = "westeu-dev-001-opt-rg"
}

data "azurerm_key_vault" "example" {
  name                = "westeuropedev1optkv"
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_key_vault_secret" "example" {
  name         = "test-secret"
  value        = keycloak_openid_client.openid_client.client_secret
  key_vault_id = data.azurerm_key_vault.example.id

  depends_on = [keycloak_openid_client.openid_client]
}

resource "keycloak_openid_client_service_account_realm_role" "client_service_account_role" {
  realm_id                = keycloak_realm.appname_realm.id
  service_account_user_id = keycloak_openid_client.openid_client.service_account_user_id
  role                    = keycloak_role.appname_realm_role.name
}