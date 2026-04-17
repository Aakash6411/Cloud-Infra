locals {
  resource_group_name = "myrg"
  location = "centralindia"
  
  virtual_network = {
  name = "vnetst1"
  address_space = "10.0.0.0/16"
}
}