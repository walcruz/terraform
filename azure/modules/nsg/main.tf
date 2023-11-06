resource "azurerm_network_security_group" "nsg" {
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  name                = var.name
}

resource "azurerm_network_security_rule" "rules" {
  for_each                    = local.nsg_rules_ordered
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  # Mandatory parameters
  name                   = each.value.name
  priority               = each.value.priority
  destination_port_range = each.value.port

  # Optional parameters (complex)
  description = lookup(
    each.value,
    "description",
    "${lookup(each.value, "access", "Allow")} ${upper(each.value.name)}"
  )
  source_address_prefix = (
    length(lookup(each.value, "source_address_prefix", "")) > 0
    ? each.value.source_address_prefix
    : (
      lookup(each.value, "allow_public", false)
      ? "*"
      : "10.0.0.0/8"
    )
  )

  # Optional parameters (simple)
  protocol                   = lookup(each.value, "protocol", "Tcp")
  direction                  = lookup(each.value, "direction", "Inbound")
  access                     = lookup(each.value, "access", "Allow")
  source_port_range          = lookup(each.value, "source_port_range", "*")
  destination_address_prefix = lookup(each.value, "destination_address_prefix", "*")
}
