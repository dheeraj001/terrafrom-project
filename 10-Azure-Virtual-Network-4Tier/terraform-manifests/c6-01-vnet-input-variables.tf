variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet-default"
}

variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_name" {
  description = "Virtual Network for web subnet name"
  type        = string
  default     = "websubnet"
}

variable "web_subnet_address" {
  description = "Virtual Network address for web subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]

}

variable "app_subnet_name" {
  description = "Virtual Network fo app"
  type        = string
  default     = "appsubnet"
}

variable "app_subnet_address" {
  description = "Virtual Network address space for address"
  type        = list(string)
  default     = ["10.0.11.0/24"]
}

variable "db_subnet_name" {
  description = "Virtual network name for database"
  type        = string
  default     = "dbsubnet"
}

variable "db_subnet_address" {
  description = "Virtual Network for database"
  type        = list(string)
  default     = ["10.0.21.0/24"]
}

variable "bastion_subnet_name" {
  description = "Virtual Network for Bastion server"
  type        = string
  default     = "bastionsubnet"
}

variable "bastion_subent_address" {
  description = "Virtual Network for Bastion server"
  type        = list(string)
  default     = ["10.0.100.0/24"]
}