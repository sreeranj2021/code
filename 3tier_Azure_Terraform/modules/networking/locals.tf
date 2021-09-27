locals { 
fensgrules = {
   
    sshfromjump = {
      name                       = "sshfromjump"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "22"
      source_address_prefix      = "10.0.3.0/24"
      destination_address_prefix = "*"
    }
 

    http = {
      name                       = "http"
      priority                   = 201
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    }

    denyintravnet = {
      name                       = "denyintravnet"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
  }
  bensgrules = {
   
    sshfromjump = {
      name                       = "sshfromjump"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "22"
      source_address_prefix      = "10.0.3.0/24"
      destination_address_prefix = "*"
    }
 

    app = {
      name                       = "app"
      priority                   = 201
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8080" // consider app runs on 8080
      source_address_prefix      = "10.0.1.0/24"
      destination_address_prefix = "*"
    }

    denyintravnet = {
      name                       = "denyintravnet"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
  }
  dbnsgrules = {
   
    sshfromjump = {
      name                       = "sshfromjump"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "22"
      source_address_prefix      = "10.0.3.0/24"
      destination_address_prefix = "*"
    }
 

    apptodb = {
      name                       = "apptodb"
      priority                   = 201
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3306"
      source_address_prefix      = "10.0.2.0/24"
      destination_address_prefix = "*"
    }

    denyintravnet = {
      name                       = "denyintravnet"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
  }

}