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
    address_prefixes = ["10.0.1.0/25"]
  },
  {
  name = "subnet2"
  address_prefixes = ["10.0.2.0/24"]
  }
]
}