output "avs_name" {
  value = azurerm_availability_set.linux_avs.name
}

output "vm_names" {
  value = azurerm_linux_virtual_machine.vm-linux[*].name
}

output "vm_fqdns" {
  value = azurerm_public_ip.linux-ip[*].fqdn
}

output "vm_private_ips" {
  value = azurerm_network_interface.linux-nic[*].private_ip_address
}

output "vm_public_ips" {
  value = azurerm_public_ip.linux-ip[*].ip_address
}
