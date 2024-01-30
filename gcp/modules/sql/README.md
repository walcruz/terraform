<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.db_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.db_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_sql_database.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.db_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_ip_range"></a> [allocated\_ip\_range](#input\_allocated\_ip\_range) | Allocated IP range for the SQL instance | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project where to create the Airflow Resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the project where to create the Airflow Resources | `string` | n/a | yes |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl) | Require SSL for the SQL instance | `bool` | `false` | no |
| <a name="input_sql_availability_type"></a> [sql\_availability\_type](#input\_sql\_availability\_type) | SQL availability type. Can be ZONAL or REGIONAL | `string` | `"ZONAL"` | no |
| <a name="input_sql_database_name"></a> [sql\_database\_name](#input\_sql\_database\_name) | SQL instance name | `string` | n/a | yes |
| <a name="input_sql_delete_protection"></a> [sql\_delete\_protection](#input\_sql\_delete\_protection) | Delete protection for the SQL instance | `bool` | `true` | no |
| <a name="input_sql_edition"></a> [sql\_edition](#input\_sql\_edition) | SQL edition. Can be ENTERPRISE or ENTERPRISE\_PLUS | `string` | `"ENTERPRISE"` | no |
| <a name="input_sql_instance_name"></a> [sql\_instance\_name](#input\_sql\_instance\_name) | SQL instance name | `string` | n/a | yes |
| <a name="input_sql_private_network"></a> [sql\_private\_network](#input\_sql\_private\_network) | Network where to create the SQL instance. Format projects/{project\_id}/global/networks/{network\_id}. | `string` | `null` | no |
| <a name="input_sql_tier"></a> [sql\_tier](#input\_sql\_tier) | Tier of the sql database | `string` | `"db-custom-1-3840"` | no |
| <a name="input_sql_user"></a> [sql\_user](#input\_sql\_user) | SQL instance name | `string` | n/a | yes |
| <a name="input_sql_version"></a> [sql\_version](#input\_sql\_version) | SQL instance version | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_random_db_password"></a> [random\_db\_password](#output\_random\_db\_password) | n/a |
| <a name="output_sql_database_ip_addres"></a> [sql\_database\_ip\_addres](#output\_sql\_database\_ip\_addres) | n/a |
<!-- END_TF_DOCS -->