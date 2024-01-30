<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.11.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.11.0 |
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.example](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azurerm_key_vault_secret.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [keycloak_oidc_identity_provider.realm_identity_provider](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/oidc_identity_provider) | resource |
| [keycloak_openid_client.openid_client](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_client) | resource |
| [keycloak_openid_client_service_account_realm_role.client_service_account_role](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_client_service_account_realm_role) | resource |
| [keycloak_realm.appname_realm](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/realm) | resource |
| [keycloak_role.appname_realm_role](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_user.admin_appname](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/user) | resource |
| [azurerm_key_vault.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [keycloak_openid_client.realm_management](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/data-sources/openid_client) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->