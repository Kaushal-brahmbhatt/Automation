output "network-rg" {
  value = azurerm_resource_group.network-rg.name
}

output "linux-rg" {
  value = azurerm_resource_group.linux-rg.name
}

output "windows-rg" {
  value = azurerm_resource_group.windows-rg.name
}