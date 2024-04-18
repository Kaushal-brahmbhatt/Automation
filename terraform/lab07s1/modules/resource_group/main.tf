resource "azurerm_resource_group" "network-rg" {
  name     = "${var.name-prefix}-network"
  location = var.location
}

resource "azurerm_resource_group" "linux-rg" {
  name     = "${var.name-prefix}-linux"
  location = var.location
}

resource "azurerm_resource_group" "windows-rg" {
  name     = "${var.name-prefix}-windows"
  location = var.location
}

