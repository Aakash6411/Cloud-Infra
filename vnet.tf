resource "azurerm_virtual_network" "vnet1" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]

  tags = {
    name = "tftst"
  }
  depends_on = [ azurerm_resource_group.RG ]
}

 resource "azurerm_subnet" "subnetA" {
  name                 = local.subnets[0].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[0].address_prefixes
  depends_on = [ azurerm_virtual_network.vnet1 ]
  }

  resource "azurerm_subnet" "subnetB" {
  name                 = local.subnets[1].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnets[1].address_prefixes
  depends_on = [ azurerm_virtual_network.vnet1 ]
  }