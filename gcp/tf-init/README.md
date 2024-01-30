<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.11.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sa"></a> [sa](#module\_sa) | ../modules/service_account | n/a |
| <a name="module_storage_bucket"></a> [storage\_bucket](#module\_storage\_bucket) | ../modules/storage_bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_service.apis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [time_sleep.wait_kms_activation](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_storage_project_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name variable | `string` | `"tfstate-devops"` | no |
| <a name="input_project_apis"></a> [project\_apis](#input\_project\_apis) | Project APIs to enabled | `list` | <pre>[<br>  "storage.googleapis.com",<br>  "container.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "iam.googleapis.com",<br>  "cloudbuild.googleapis.com",<br>  "secretmanager.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "cloudkms.googleapis.com",<br>  "sqladmin.googleapis.com",<br>  "servicenetworking.googleapis.com"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | `"walter-sre-test"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-central1"` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | SA roles | `list` | <pre>[<br>  "roles/editor"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->