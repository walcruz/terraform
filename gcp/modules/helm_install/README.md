<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.helm](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm_chart"></a> [helm\_chart](#input\_helm\_chart) | Helm chart Name | `string` | n/a | yes |
| <a name="input_helm_name"></a> [helm\_name](#input\_helm\_name) | Helm resource Name | `string` | n/a | yes |
| <a name="input_helm_namespace"></a> [helm\_namespace](#input\_helm\_namespace) | Kubernets namespace | `string` | n/a | yes |
| <a name="input_helm_repository"></a> [helm\_repository](#input\_helm\_repository) | Helm Repository | `string` | n/a | yes |
| <a name="input_helm_values"></a> [helm\_values](#input\_helm\_values) | Helm values file path | `string` | n/a | yes |
| <a name="input_helm_version"></a> [helm\_version](#input\_helm\_version) | Helm Version | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->