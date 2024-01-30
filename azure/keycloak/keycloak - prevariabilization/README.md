<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | 4.0.1 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.keycloak](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [keycloak_custom_identity_provider_mapper.koidc](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/custom_identity_provider_mapper) | resource |
| [keycloak_oidc_identity_provider.realm_identity_provider](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/oidc_identity_provider) | resource |
| [keycloak_openid_client.openid_client](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_client) | resource |
| [keycloak_openid_client_service_account_realm_role.client_service_account_role](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_client_service_account_realm_role) | resource |
| [keycloak_openid_script_protocol_mapper.scoped_roles](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_script_protocol_mapper) | resource |
| [keycloak_openid_user_attribute_protocol_mapper.invited](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_user_attribute_protocol_mapper) | resource |
| [keycloak_openid_user_attribute_protocol_mapper.sa](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/openid_user_attribute_protocol_mapper) | resource |
| [keycloak_realm.appname_realm](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/realm) | resource |
| [keycloak_role.appname_realm_role](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_cp_admin](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_cp_contributor](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_cp_reader](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_efa_admin](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_efa_contributor](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_role.role_efa_reader](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/role) | resource |
| [keycloak_user.admin_appname](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/resources/user) | resource |
| [azuread_application.keycloak](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application) | data source |
| [azurerm_key_vault.keycloak](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.keycloak](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_resource_group.keycloak](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [keycloak_openid_client.realm_management](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/data-sources/openid_client) | data source |
| [keycloak_realm.admin_realm](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/data-sources/realm) | data source |
| [keycloak_role.each_realmcr](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/data-sources/role) | data source |
| [keycloak_role.offline_access](https://registry.terraform.io/providers/mrparkers/keycloak/4.0.1/docs/data-sources/role) | data source |
| [template_file.script_mapper](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environ"></a> [environ](#input\_environ) | The environment (plus optional intent) this resources belong to. Set it as empty string for production. | `string` | n/a | yes |
| <a name="input_kv_name_client_secret"></a> [kv\_name\_client\_secret](#input\_kv\_name\_client\_secret) | The name in KeyVault for storing the Client Secret (the AD Application password) | `string` | `"ad-keycloak-client-secret"` | no |
| <a name="input_realm_management_crole"></a> [realm\_management\_crole](#input\_realm\_management\_crole) | The list of permisions of realm-management | `list(any)` | <pre>[<br>  "create-client",<br>  "impersonation",<br>  "manage-authorization",<br>  "manage-clients",<br>  "manage-events",<br>  "manage-identity-providers",<br>  "manage-realm",<br>  "manage-users",<br>  "query-clients",<br>  "query-groups",<br>  "query-realms",<br>  "query-users",<br>  "realm-admin",<br>  "view-authorization",<br>  "view-clients",<br>  "view-events",<br>  "view-identity-providers",<br>  "view-realm",<br>  "view-users"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->