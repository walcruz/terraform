# Peering Src --> Dst
resource "azurerm_virtual_network_peering" "src-dst" {
  name                      = "${format(var.resource_naming_template, 1, "${var.name_src}-${var.name_dst}")}-peering"
  resource_group_name       = var.resource_group_name_src
  virtual_network_name      = var.vnet_name_src
  remote_virtual_network_id = var.vnet_id_dst

  provider = azurerm.src
}

# Peering Src <-- Dst
resource "azurerm_virtual_network_peering" "dst-src" {
  name                      = "${format(var.resource_naming_template, 1, "${var.name_dst}-${var.name_src}")}-peering"
  resource_group_name       = var.resource_group_name_dst
  virtual_network_name      = var.vnet_name_dst
  remote_virtual_network_id = var.vnet_id_src

  provider = azurerm.dst
}
