resource "azuread_application" "example" {
  display_name     = "example"
  identifier_uris  = ["api://example-app"]
  #we want put logo there?
  #logo_image       = filebase64("/path/to/logo.png")
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMultipleOrgs"

  api {
    mapped_claims_enabled          = true
    requested_access_token_version = 2

    known_client_applications = [
      azuread_application.known1.application_id,
      azuread_application.known2.application_id,
    ]

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access example on behalf of the signed-in user."
      admin_consent_display_name = "Access example"
      enabled                    = true
      id                         = "XXXXXX-XXX-XX...."
      type                       = "User"
      user_consent_description   = "Allow the application to access example on your behalf."
      user_consent_display_name  = "Access example"
      value                      = "user_impersonation"
    }

    oauth2_permission_scope {
      admin_consent_description  = "Administer the example application"
      admin_consent_display_name = "Administer"
      enabled                    = true
      id                         = "XXXXXX-XXX-XX...."
      type                       = "Admin"
      value                      = "administer"
    }
  }

  app_role {
    allowed_member_types = ["User", "Application"]
    description          = "Admins can manage roles and perform all task actions"
    display_name         = "Admin"
    enabled              = true
    id                   = "XXXXXX-XXX-XX...."
    value                = "admin"
  }

  app_role {
    allowed_member_types = ["User"]
    description          = "ReadOnly roles have limited query access"
    display_name         = "ReadOnly"
    enabled              = true
    id                   = "XXXXXX-XXX-XX...."
    value                = "User"
  }

  feature_tags {
    enterprise = true
    gallery    = true
  }

  optional_claims {
    access_token {
      name = "myclaim"
    }

    access_token {
      name = "otherclaim"
    }

    id_token {
      name                  = "userclaim"
      source                = "user"
      essential             = true
      additional_properties = ["emit_as_roles"]
    }

    saml2_token {
      name = "samlexample"
    }
  }

  required_resource_access {
    resource_app_id = "XXXXXX-XXX-XX...." # Microsoft Graph

    resource_access {
      id   = "XXXXXX-XXX-XX...." # User.Read.All
      type = "Role"
    }

    resource_access {
      id   = "XXXXXX-XXX-XX...." # User.ReadWrite
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = "XXXXXX-XXX-XX...." # Office 365 Management

    resource_access {
      id   = "XXXXXX-XXX-XX...." # ActivityFeed.Read
      type = "Role"
    }
  }

  web {
    homepage_url  = "https://app.example.net"
    logout_url    = "https://app.example.net/logout"
    redirect_uris = ["https://app.example.net/account"]

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }
}

resource "keycloak_oidc_identity_provider" "realm_identity_provider" {
  realm             = keycloak_realm.appname_realm.id
  alias             = "appname"
  authorization_url = "https://authorizationurl.com"
  client_id         = "clientID"
  client_secret     = "clientSecret"
  token_url         = "https://tokenurl.com"

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}