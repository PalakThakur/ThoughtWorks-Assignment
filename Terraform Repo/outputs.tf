# The output variables are those values that we need as output after the Terraform has run.
# E.g we would need properties of various services created like group name, app name , storage account name 
# These values we will use in during the release pipeline for deployment purpose.

output "rg_name" 
{
  value = "${azurerm_resource_group.rg.name}"
}

output "java_app_service_name" 
{
  value = "${azurerm_app_service.java_app.name}"
}

output "imagesblobname" 
{
    value = "${azurerm_storage_container.uatapp-imageblob.name}"
}

output "stylesblobname" 
{
    value = "${azurerm_storage_container.uatapp-stylesblob.name}"
}

output "storageaccountname" 
{
    value = "${azurerm_storage_account.uatapp-storage.name}"
}