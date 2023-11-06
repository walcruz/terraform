terraform {
  required_version = "= 1.2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
    random = {
      version = "~> 3.1"
    }
  }
  backend "azurerm" {
    subscription_id      = "XXXXXX-XX-X..."
    resource_group_name  = "rg-name"
    storage_account_name = "sa-name"
    container_name       = "tfstate"
    key                  = "x.terraform.tfstate"
  }
}
