
variable "resource_naming_template" {
  type = string
}

variable "resource_group_name_dst" {
  description = "Destination resource group name"
  type        = string
}

variable "resource_group_name_src" {
  description = "Source resource group name"
  type        = string
}

variable "vnet_name_dst" {
  description = "Destination VNet name"
  type        = string
}

variable "vnet_name_src" {
  description = "Source VNet name"
  type        = string
}

variable "vnet_id_dst" {
  description = "Destination VNet ID"
  type        = string
}

variable "vnet_id_src" {
  description = "Source VNet ID"
  type        = string
}

variable "name_src" {
  description = "Source name (for resource naming)"
  type        = string
}

variable "name_dst" {
  description = "Destination name (for resource naming)"
  type        = string
}

variable "tags" {
  default = ""
}
