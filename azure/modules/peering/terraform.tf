terraform {
  required_providers {
    azurerm = {
      configuration_aliases = [
        azurerm.src,
        azurerm.dst
      ]
    }
  }
}
