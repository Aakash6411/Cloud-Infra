resource "azurerm_storage_account" "Storage" {
  name                     = "teststrg98"
  resource_group_name      = "myrg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.RG ]
}

resource "azurerm_storage_container" "Container" {
  name                  = "containertst98"
  storage_account_id    = "teststrge98"
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.Storage ]
}

resource "azurerm_storage_blob" "Blob" {
  name                   = "new98"
  storage_account_name   = "teststrge98"
  storage_container_name = "containertst98"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [ azurerm_storage_container.Container ]
}