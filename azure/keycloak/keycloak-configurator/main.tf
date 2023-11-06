terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.0.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.11.0"
    }
  }
}

provider "azurerm" {
  # alias = "dev"
  features {
    /* key_vault {
      purge_soft_delete_on_destroy = true
    } */
  }
}
provider "keycloak" {
  client_id = "admin-cli"
  username  = "admin"
  password  = "password"
  url       = "http://localhost:8080/auth"
}

