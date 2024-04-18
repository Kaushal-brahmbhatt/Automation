**Assignment 1 - Terraform Modules for Azure Resource Provisioning**

This project contains a set of Terraform modules designed to provision various resources on Microsoft Azure. These modules are organized hierarchically to promote reusability, scalability, and maintainability. Below is a detailed description of each module and how to use them.

### Modules Overview:

1. **rgroup-n01605052 Module:**
   - This module provisions a single Azure Resource Group.
   - Returns the name of the resource group to the root module.

2. **network-n01605052 Module:**
   - Provisions a virtual network with a subnet and associated network security group.
   - Network security group allows traffic over ports 22, 3389, 5985, and 80.
   - Returns the names of the virtual network and subnet to the root module.

3. **common-n01605052 Module:**
   - Provisions a log analytics workspace, a recovery services vault, and a standard storage account with LRS redundancy.
   - Returns the names of these resources to the root module.

4. **vmlinux-n01605052 Module:**
   - Provisions CentOS 8.2 Linux VMs with public IP addresses in an availability set.
   - Installs Network Watcher extension and Azure Monitor extension.
   - Returns hostnames, domain names, private IP addresses, and public IP addresses of the VMs to the root module.

5. **vmwindows-n01605052 Module:**
   - Provisions a Windows Server 2016 VM with a public IP address in an availability set.
   - Installs Antimalware extension.
   - Returns the hostname, domain name, private IP address, and public IP address of the VM to the root module.

6. **datadisk-n01605052 Module:**
   - Provisions and attaches 4 x 10GB disks to the VMs.

7. **loadbalancer-n01605052 Module:**
   - Provisions a public-facing basic load balancer with Linux VMs behind it.
   - Returns the name of the load balancer to the root module.

8. **database-n01605052 Module:**
   - Provisions an Azure DB for PostgreSQL Single Server instance.
   - Returns the name of the DB instance to the root module.

### How to Use:

1. **Root Module (assignment1-n01605052):**
   - Define all child modules within this root module.
   - Use the outputs received from child modules to print on the screen upon successful deployment.

2. **Child Modules:**
   - Each child module can be used independently or as part of the root module.
   - Configure input variables according to your requirements.
   - Import the necessary resources into your Terraform configuration.

### Notes:

- Ensure that appropriate Azure credentials are configured for Terraform to interact with Azure services.
- Review and customize the input variables and resource configurations according to your specific needs.
- Execute `terraform init`, `terraform plan`, and `terraform apply` commands within the root module directory to deploy the resources.