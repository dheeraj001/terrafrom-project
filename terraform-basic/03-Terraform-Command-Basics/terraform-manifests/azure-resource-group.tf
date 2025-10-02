terraform {
  required_version = ">= 1.11.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"

}

resource "azurerm_resource_group" "my_demo_rg1" {
  name     = "my-demo"
  location = "eastus"

}