terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

resource "azurerm_resource_group" "RG" {
  name     = "myrg"
  location = "West Europe"
}
