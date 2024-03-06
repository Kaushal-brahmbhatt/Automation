resource "null_resource" "linux_hostname_display" {
  count = var.nb-count
  
  depends_on = [azurerm_linux_virtual_machine.linux-vm]

  provisioner "remote-exec" {
    connection {
        type        = "ssh"
        user        = var.admin_username
        private_key = file("${var.priv_key}")
        host        = azurerm_public_ip.linux-pip[count.index].fqdn
    }
    inline = [
      "echo 'The hostname is: ' $(hostname)"
    ]
  }
}