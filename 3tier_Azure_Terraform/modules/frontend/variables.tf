variable "rg_location" {
  type        = string
  description = "RG location"
}
variable "resource_group_name" {
  type        = string
  description = "RG name"
}
variable "env_prefix" {
  type        = string
  description = "Enviornment Name"
}
variable "type" {
  type        = string
  description = "Tier type"
}
variable "seq_id" {
  type        = string
  description = "Sequence ID"
}
variable "fesnet_id" {
  type        = string
  description = "Subnet ID for the frontend subnet"
}