variable "business_division" {
  description = "Business Division of the sap for airtel"
  type        = string
  default     = "sap"
}

variable "environment" {
  description = "Environment variable used as prefix"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "default_rg"
}

variable "resource_group_location" {
  description = "Resource group location"
  type        = string
  default     = "East Us2"
}