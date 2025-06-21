# Configure the AzureRM provider
# This block tells Terraform that we'll be interacting with Azure.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Use a compatible version (e.g., "~> 3.0" or "~> 3.90.0")
    }
  }
}

# Provider configuration for Azure
# This assumes you've already authenticated via Azure CLI (`az login`).
provider "azurerm" {
  features {} # Required for current versions of the AzureRM provider
}

# 1. Create a Resource Group
# A logical container for your Azure resources.
resource "azurerm_resource_group" "my_resource_group" {
  name     = "my-basic-storage-rg"  # Unique name for your resource group
  location = "East US"              # Choose an Azure region (e.g., "East US", "West Europe", "centralindia")
}

# 2. Create an Azure Storage Account
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "mybasicstorageacc001" # This name MUST be globally unique (3-24 lowercase letters/numbers)
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  location                 = azurerm_resource_group.my_resource_group.location
  account_tier             = "Standard"             # Performance tier: Standard (general purpose) or Premium
  account_replication_type = "LRS"                  # Data redundancy: LRS (Locally Redundant Storage - 3 copies in one datacenter)
  }
