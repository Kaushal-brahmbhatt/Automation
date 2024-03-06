output "resource_group_names" {
  value = "${module.resource_group.linux-rg} ${module.resource_group.windows-rg} ${module.resource_group.network-rg}"
}

output "network_name" {
  value = "${module.network.vnet-name}, namespace: ${module.network.vnet-address-space[0]}"
}

output "subnets" {
  value = "${module.network.subnet1-name}, namespace: ${module.network.subnet1-address-prefix[0]} ${module.network.subnet2-name}, namespace: ${module.network.subnet2-address-prefix[0]}"
}

output "security_groups" {
  value = "${module.network.nsg1-name}, ${module.network.nsg2-name}"
}

output "linux_avaliability_set_name" {
  value = module.linux_vm.avs_name
}

output "linux_vm_hostname" {
  value = module.linux_vm.vm_names
}

output "linux_vm_fqdns" {
  value = module.linux_vm.vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.linux_vm.vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.linux_vm.vm_public_ips
}

output "windows_avaliability_set_name" {
  value = module.window_vm.avs_name
}

output "windows_vm_hostname" {
  value = module.window_vm.vm_names
}

output "windows_vm_fqdns" {
  value = module.window_vm.vm_fqdns
}

output "windows_vm_private_ips" {
  value = module.window_vm.vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.window_vm.vm_public_ips
}
