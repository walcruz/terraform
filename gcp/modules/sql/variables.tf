variable "project_id" {
  type        = string
  description = "ID of the project where to create the Airflow Resources"
}

variable "region" {
  type        = string
  description = "Region of the project where to create the Airflow Resources"
}

variable "sql_instance_name" {
  type        = string
  description = "SQL instance name"
}

variable "sql_database_name" {
  type        = string
  description = "SQL instance name"
}

variable "sql_user" {
  type        = string
  description = "SQL instance name"
}

variable "sql_edition" {
  type        = string
  description = "SQL edition. Can be ENTERPRISE or ENTERPRISE_PLUS"
  default     = "ENTERPRISE"
}

variable "sql_version" {
  type        = string
  description = "SQL instance version"
}

variable "sql_tier" {
  type        = string
  description = "Tier of the sql database"
  default     = "db-custom-1-3840"
}

variable "sql_private_network" {
  type        = string
  description = "Network where to create the SQL instance. Format projects/{project_id}/global/networks/{network_id}."
  default     = null
}

variable "allocated_ip_range" {
  type        = string
  description = "Allocated IP range for the SQL instance"
  default     = null
}

variable "require_ssl" {
  type        = bool
  description = "Require SSL for the SQL instance"
  default     = false
}

variable "sql_delete_protection" {
  type        = bool
  description = "Delete protection for the SQL instance"
  default     = true
}

variable "sql_availability_type" {
  type        = string
  description = "SQL availability type. Can be ZONAL or REGIONAL"
  default     = "ZONAL"
}