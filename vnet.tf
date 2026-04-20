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

  resource "azurerm_network_interface" "nic" {
  name = "nic1"
  location = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal1"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip1.id
  }
  depends_on = [ azurerm_subnet.subnetA ]
}

resource "azurerm_public_ip" "publicip1" {
  name                = "test_publicip"
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
  depends_on = [ azurerm_resource_group.RG ]
}