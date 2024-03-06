
output "vnet-name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "vnet-address-space" {
  value = azurerm_virtual_network.network-vnet.address_space
}

output "subnet1-id" {
  value = azurerm_subnet.network-subnet1.id
}

output "subnet2-id" {
  value = azurerm_subnet.network-subnet2.id
}

output "subnet1-name" {
  value = azurerm_subnet.network-subnet1.name
}

output "subnet1-address-prefix" {
  value = azurerm_subnet.network-subnet1.address_prefixes
}

output "subnet2-name" {
  value = azurerm_subnet.network-subnet2.name
}

output "subnet2-address-prefix" {
  value = azurerm_subnet.network-subnet2.address_prefixes
}

output "nsg1-name" {
  value = azurerm_network_security_group.network-nsg1.name
}

output "nsg2-name" {
  value = azurerm_network_security_group.network-nsg2.name
}