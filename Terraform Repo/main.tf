# This block is to define the Azure Provider
# This block is required to let the terraform interpretter know that we would be using Azure Provider

provider "azurerm" {
    
  version = "~> 1.26.0"

  subscription_id = "${var.subscription_id}"
	client_id = "${var.client_id}"
	client_secret = "${var.client_secret}"
	tenant_id = "${var.tenant_id}"

}

# Set of related local values can be declared together in a single locals block

locals {
  prefix = "${var.env_name}-${var.app_name}"
  azure_region = "Central US"
  failover_location = "East US"
}

# Create a resource group for Hosting the WebApp

resource "azurerm_resource_group" "rg" {
    name = "${var.resource_group}"
    location = "${local.azure_region}"
}