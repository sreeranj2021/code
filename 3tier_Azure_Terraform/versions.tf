terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
      
    }
  }
}

provider "azurerm" {
#  subscription_id = "5fb5f4f6-456d-484e-bdc8-87c185f5a318"
#  client_id       = "34c2c7cd-4338-4df2-ae56-0e03b941c804"
#  tenant_id       = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
##
#
  features {
  }    
  
}
terraform {
  backend "azurerm" {
    resource_group_name   = "DefaultResourceGroup-EUS"
    storage_account_name  = "terraformbase100"
    container_name        = "terraformstate"
    key                   = "terraform.tfstate"
  }
}