resource "azurerm_virtual_network" "vnet1" {
  name                = "vnetst1"
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }
  depends_on = [ azurerm_resource_group.RG ]

  tags = {
    name = "tftst"
  }
}