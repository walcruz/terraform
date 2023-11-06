provider "azurerm" {
  features {}
}

module "tags" {
  source = "repogit-tag"
  environ = var.environ
  purpose = var.purpose
  tags_version = "1.3"
}

resource "azurerm_storage_account" "terraform" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = module.tags.tags
}

resource "azurerm_storage_container" "terraform-container" {
  for_each                 = toset(["dev", "stg", "prd"])
  name                     = format("%s-%s-%s", azurerm_storage_account.terraform.name, var.container_name, each.key)
  storage_account_name     = azurerm_storage_account.terraform.name
  container_access_type    = "private"
}
