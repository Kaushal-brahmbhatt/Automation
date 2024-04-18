terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01605052RG"
    storage_account_name = "tfstaten01605052sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}