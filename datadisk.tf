resource "azurerm_managed_disk" "datadisk1" {
  name                 = "data-disk1"
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachment1" {
  managed_disk_id    = azurerm_managed_disk.datadisk1.id
  virtual_machine_id = azurerm_windows_virtual_machine.tstvm.id
  lun                = "1"
  caching            = "ReadWrite"
}