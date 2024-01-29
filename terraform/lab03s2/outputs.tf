output "vm_hostname" {
  value = azurerm_linux_virtual_machine.linux-vm.computer_name
}

output "vm_fqdn" {
  value = azurerm_public_ip.linux-pip.fqdn
}

output "vm_private_ip" {
  value = azurerm_network_interface.linux-nic.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_public_ip.linux-pip.ip_address
}

output "vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network-vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.network-subnet1.name
}

output "subnet1_address_space" {
  value = azurerm_subnet.network-subnet1.address_prefixes
}

output "subnet2_name" {
  value = azurerm_subnet.network-subnet2.name
}

output "subnet2_address_space" {
  value = azurerm_subnet.network-subnet2.address_prefixes
}