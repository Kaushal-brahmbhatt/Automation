output "avs_name" {
  value = azurerm_availability_set.win_avs.name
}

output "vm_names" {
  value = azurerm_windows_virtual_machine.vm-win[*].name
}

output "vm_fqdns" {
  value = azurerm_public_ip.win-ip[*].fqdn
}

output "vm_private_ips" {
  value = azurerm_network_interface.win-nic[*].private_ip_address
}

output "vm_public_ips" {
  value = azurerm_public_ip.win-ip[*].ip_address
}
