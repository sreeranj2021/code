
 # Module defines backend resources Public LB, Public IP,Availability Set and 2 VMs in availablility set
 /*resource "azurerm_public_ip" "backend" {
   name                         = "${var.env_prefix}${var.type}piplb${var.seq_id}"
   location                     =  var.rg_location
   resource_group_name          = var.resource_group_name
   allocation_method            = "Static"
 }*/


        /* resource "azurerm_lb" "new_terraform_lb_web" {
        name                = "lb-${var.web_lb_name}-${var.environment}-vdc-001"
        location            =  azurerm_resource_group.existing_terraform_rg.location
        resource_group_name =  azurerm_resource_group.existing_terraform_rg.name
        sku = var.lb_Sku
        frontend_ip_configuration {
            name                 = "PrivateIPAddress-${var.web_lb_name}"
            subnet_id            = azurerm_subnet.new_terraform_subnet_web.id
            private_ip_address   = var.web_lb_private_IP
            private_ip_address_allocation = "Static"
        }
        }*/
 resource "azurerm_lb" "backend" {
   name                = "${var.env_prefix}${var.type}lb${var.seq_id}"
   location            =  var.rg_location
   resource_group_name = var.resource_group_name
   frontend_ip_configuration {
     name                 = "${var.env_prefix}${var.type}lbfip${var.seq_id}"
     #public_ip_address_id = azurerm_public_ip.backend.id
     subnet_id            = var.besnet_id
     private_ip_address_allocation = "Dynamic"
   }
 }
 resource "azurerm_lb_backend_address_pool" "backend" {
   loadbalancer_id     = azurerm_lb.backend.id
   name                = "${var.env_prefix}${var.type}lbbe${var.seq_id}"
 }
 resource "azurerm_network_interface" "backend" {
   count               = 2
   name                = "${var.env_prefix}${var.type}nicvm${count.index}"
   location            =  var.rg_location
   resource_group_name = var.resource_group_name
   ip_configuration {
     name                          = "${var.env_prefix}${var.type}vmipconfig"
     subnet_id                     = var.besnet_id
     private_ip_address_allocation = "dynamic"
   }
 }
 resource "azurerm_availability_set" "avset" {
   name                         = "${var.env_prefix}${var.type}avset${var.seq_id}"
   location                     =  var.rg_location
   resource_group_name          = var.resource_group_name
   platform_fault_domain_count  = 2
   platform_update_domain_count = 2
   managed                      = true
 }
 resource "azurerm_virtual_machine" "backend" {
   count                 = 2
   name                  = "${var.env_prefix}${var.type}vm${count.index}"
   location              =  var.rg_location
   availability_set_id   = azurerm_availability_set.avset.id
   resource_group_name   = var.resource_group_name
   network_interface_ids = [element(azurerm_network_interface.backend.*.id, count.index)]
   vm_size               = "Standard_B1s"
   delete_os_disk_on_termination = true
   delete_data_disks_on_termination = true
   storage_image_reference {
     publisher = "Canonical"
     offer     = "UbuntuServer"
     sku       = "18.04-LTS"
     version   = "latest"
   }
   storage_os_disk {
     name              = "${var.env_prefix}${var.type}osdiskvm${count.index}"
     caching           = "ReadWrite"
     create_option     = "FromImage"
     managed_disk_type = "Standard_LRS"
   }
   # Optional data disks
   storage_data_disk {
     name              = "${var.env_prefix}${var.type}datadisk${count.index}"
     managed_disk_type = "Standard_LRS"
     create_option     = "Empty"
     lun               = 0
     disk_size_gb      = "10"
   }
    os_profile {
     computer_name  = "backendvm${count.index}"
     admin_username = "testadmin"
     admin_password = "Password1234!"
   }
   os_profile_linux_config {
     disable_password_authentication = false
   }
   tags = {
     environment = "${var.env_prefix}"
   }
 }