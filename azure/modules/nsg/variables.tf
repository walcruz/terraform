variable "location" {
  description = "Location where the NSG and its rules will be created"
}

variable "resource_group_name" {
  description = "Resource Group where the NSG and its rules will be created"
}

variable "name" {
  description = "Resource Group where the NSG and its rules will be created"
}

variable "tags" {
  description = "Tags to add to the NSG"
}

variable "rules" {
  description = "Rules to add to the Network Security Group (NSG)"
  default     = []
}

locals {
  nsg_rules_ordered = {
    for order, rule in var.rules
    : rule.name => merge(rule, { priority : 100 + (order * 5) })
  }
}
