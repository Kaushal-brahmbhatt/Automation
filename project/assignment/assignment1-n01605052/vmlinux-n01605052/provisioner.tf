resource "null_resource" "ansible_provisioner" {
  count      = var.vm_count
  depends_on = [azurerm_linux_virtual_machine.vm-linux]

  provisioner "local-exec" {
    command = "ansible-playbook -i /home/kaushal/automation/project/ansible/hosts /home/kaushal/automation/project/ansible/n01605052-playbook.yaml"
  }
}
