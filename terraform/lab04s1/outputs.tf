output "vm_hostname" {
  value = [for vm in azurerm_linux_virtual_machine.linux-vm : vm.computer_name]
}

output "vm_fqdn" {
  value = [for pip in azurerm_public_ip.linux-pip : pip.fqdn]
}

output "vm_private_ip" {
  value = [for nic in azurerm_network_interface.linux-nic : nic.private_ip_address]
}

output "vm_public_ip" {
  value = [for pip in azurerm_public_ip.linux-pip : pip.ip_address]
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

output "linux_avset" {
  value = azurerm_availability_set.linux_avset.name
}