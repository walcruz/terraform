<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm.dst"></a> [azurerm.dst](#provider\_azurerm.dst) | n/a |
| <a name="provider_azurerm.src"></a> [azurerm.src](#provider\_azurerm.src) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.dst-src](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.src-dst](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_dst"></a> [name\_dst](#input\_name\_dst) | Destination name (for resource naming) | `string` | n/a | yes |
| <a name="input_name_src"></a> [name\_src](#input\_name\_src) | Source name (for resource naming) | `string` | n/a | yes |
| <a name="input_resource_group_name_dst"></a> [resource\_group\_name\_dst](#input\_resource\_group\_name\_dst) | Destination resource group name | `string` | n/a | yes |
| <a name="input_resource_group_name_src"></a> [resource\_group\_name\_src](#input\_resource\_group\_name\_src) | Source resource group name | `string` | n/a | yes |
| <a name="input_resource_naming_template"></a> [resource\_naming\_template](#input\_resource\_naming\_template) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `string` | `""` | no |
| <a name="input_vnet_id_dst"></a> [vnet\_id\_dst](#input\_vnet\_id\_dst) | Destination VNet ID | `string` | n/a | yes |
| <a name="input_vnet_id_src"></a> [vnet\_id\_src](#input\_vnet\_id\_src) | Source VNet ID | `string` | n/a | yes |
| <a name="input_vnet_name_dst"></a> [vnet\_name\_dst](#input\_vnet\_name\_dst) | Destination VNet name | `string` | n/a | yes |
| <a name="input_vnet_name_src"></a> [vnet\_name\_src](#input\_vnet\_name\_src) | Source VNet name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->