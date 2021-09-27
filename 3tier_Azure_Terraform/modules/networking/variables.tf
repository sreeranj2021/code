variable "vnet_name" {
  type        = string
  description = "Vnet name"
}
variable "address_space" {
  type        = list(string)
  description = "The Azure Region"
}
variable "rg_location" {
  type        = string
  description = "The Azure Region"
}
variable "resource_group_name" {
  type        = string
  description = "The Azure Region"
}
variable "snet01_name" {
  type        = string
  description = "Snet01 Name - Frontend"
}
variable "snet01_prefix" {
  type        = list(string)
  description = "Snet01 Prefix"
}
variable "snet02_name" {
  type        = string
  description = "Snet02 Name - Backend app"
}
variable "snet02_prefix" {
  type        = list(string)
  description = "Snet02 Prefix"
}
variable "snet03_name" {
  type        = string
  description = "Snet03 Name - Jumpbox"
}
variable "snet03_prefix" {
  type        = list(string)
  description = "Snet03 Prefix"
}
variable "snet04_name" {
  type        = string
  description = "Snet04 Name - DB"
}
variable "snet04_prefix" {
  type        = list(string)
  description = "Snet04 Prefix"
}