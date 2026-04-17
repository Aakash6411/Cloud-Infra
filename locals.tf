locals {
  resource_group_name = "myrg"
  location = "centralindia"
  
  virtual_network = {
  name = "vnetst1"
  address_space = "10.0.0.0/16"
}

subnets = [
  {
    name = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  },
  {
  name = "subnet2"
  address_prefixes = ["10.0.2.0/24"]
  }
]
}

resource "azurerm_network_interface" "nic" {
  name = "nic1"
  location = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal1"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ azurerm_subnet.subnetA ]
}