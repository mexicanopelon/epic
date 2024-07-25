variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "cdelapaz-poc"
  description = "Resource group name."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureadmin"
}

variable "department" {
  type        = string
  description = "The name of the Department."
}

variable "project" {
  type        = string
  description = "The name of the project."
}

variable "owner" {
  type        = string
  description = "Project owner."
}

variable "env" {
  type        = string
  description = "The environment name."
  default = "dev"
}

variable "release" {
  type        = string
  description = "The release name."
}

