# This block when defined saves the terraform state and keeps it in Azure Storage Account
# This approach is recommended to prevent the terraform code being tempered

terraform 
{
	backend "azurerm" {} 
}