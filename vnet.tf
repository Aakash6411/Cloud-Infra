resource "azurerm_virtual_network" "vnet1" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]

  subnet {
    name             = local.subnets[0].name
    address_prefixes = local.subnets[0].address_prefixes
  }

  subnet {
    name             = local.subnets[1].name
    address_prefixes = local.subnets[1].address_prefixes
  }
  depends_on = [ azurerm_resource_group.RG ]

  tags = {
    name = "tftst"
  }
}