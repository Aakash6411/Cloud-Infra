resource "azurerm_storage_account" "Storage" {
  name                     = "teststrg9898"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.RG ]
}

resource "azurerm_storage_container" "Container" {
  name                  = "containertst98"
  storage_account_name =  "teststrg9898"
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.Storage ]
}

resource "azurerm_storage_blob" "Blob" {
  name                   = "new98"
  storage_account_name   = "teststrg9898"
  storage_container_name = "containertst98"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [ azurerm_storage_container.Container ]
}