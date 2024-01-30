<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.91.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =2.91.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | repogit-tag | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.terraform](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.terraform-container](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | n/a | `string` | `"repository"` | no |
| <a name="input_division"></a> [division](#input\_division) | n/a | `string` | `"some_division"` | no |
| <a name="input_environ"></a> [environ](#input\_environ) | n/a | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | n/a | `string` | `"repository"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"rg-name"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `"sa_name"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->