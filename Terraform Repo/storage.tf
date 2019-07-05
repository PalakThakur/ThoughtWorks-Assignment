# This code will create storage account which will have containers to hold the images and style sheets as blob files.

resource "azurerm_storage_account" "uatapp-storage" {
  name                     = "${var.app_name}${var.env_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags {
    environment = "${var.env_name}"
  }
}

resource "azurerm_storage_container" "uatapp-imageblob" {
  name                  = "images"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.shadecloud-storage.name}"
}

resource "azurerm_storage_container" "uatapp-stylesblob" {
  name                  = "styles"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.shadecloud-storage.name}"
}