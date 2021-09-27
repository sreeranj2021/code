# A 3 tier architecture approach in Azure.

## Tiers
1. Frontend
2. Backend - App Tier
3. DB tier - Mysql PaaS
4. Management - Jumpbox to be placed to manage VMs over SSH.


## Overview

All the resources are deployed in a single resource group. Naming conventions is applied, so that same code with minimum changes may be used to provision another set of similar enviornment.

## Networking

1. A Vnet with following subnets - Frontend Subnet,Backend Subnet,DB subnet, Jumpbox subnet
2. NSG associated with each subnet and open only required ports/subnets
3. Access to frontend is only allowed from port 80/443 from LB
4. Access to backend is allowed from app port from frontend subnet
5. Access to DB subnet allowed from 3306 of backend subnet

## Tiers Explained

### Frontend

It consists of a LB which accepts trafic from external and send it to VMs allocated in a availability set (2 Front VMs running webservers/reverse proxy). 

### Backend app

It consists of a Internal LB which accepts trafic from frontend subnet. LB load balances the traffic to VMs in a availability set (2 App VMs). 

### DB tier

It consits of Azure Mysql server, which is integrated with DB subnet.

### Management Tier - TODO
TODO: To place Jumpbox,KV,Log Analytics workspace, Storage account etc.

## The Terraform 

### Pre-requisites

1. Access to Azure with appropriates rights to execute terraform code
2. Create a storage account and container to store the remote state file, defined in versions.tf


### Modules
 5 modules are used :
1. frontend - This defines frontend tier resources, includes LB, public IPs, Availability set and VMs
2. backend - This defines backend tier resources, includes Internal LB, Availability set and VMs
3. dbtier - This defines the Mysql PaaS server and network intergration of it
4. networking - This defines networking components like, VM, Subnets,NSGs
5. management - TODO: To place Jumpbox,KV,Log Analytics workspace, Storage account etc.


### Improvements - To do

1. Enable logging and auditing for VMs and apply minimum security baselines for components. Introduce Storage account and Log analytics workspace.
2. Use keyvault to save senistive information
3. Include LB probes, rules etc based on app requirement
4. Use Application gateway instead of frontend LB and enable WAF.
5. Use VMSS instead of frontend VMs
6. Introduce custom script extension for VMs to perform init script execution while provisoning.
7. Use hardened image/custom image by making use of Azure image gallery.





