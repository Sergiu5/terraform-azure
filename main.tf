terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

# Resource Group (Free Tier)
resource "azurerm_resource_group" "example" {
  name     = "terraform-free-tier-rg"
  location = "East US"
}

# Storage Account (Free Tier)
resource "azurerm_storage_account" "example" {
  name                     = "terraformstorage2153"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
