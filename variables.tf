#------------------------------------------------------------------------------------
# variables for vault
#------------------------------------------------------------------------------------
variable "vault_address" {
  description = "The address of the Vault server"
  type        = string
}

variable "vault_token" {
  description = "The authentication token for Vault"
  type        = string
  sensitive   = true
}
#------------------------------------------------------------------------------------
# variables for VPC 
#------------------------------------------------------------------------------------
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet1_name" {
  description = "Name of subnet 1"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for subnet 1"
  type        = string
}

variable "subnet2_name" {
  description = "Name of subnet 2"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for subnet 2"
  type        = string
}

variable "subnet3_name" {
  description = "Name of subnet 3"
  type        = string
}

variable "subnet3_cidr" {
  description = "CIDR block for subnet 3"
  type        = string
}

variable "az" {
  description = "Availability Zone to deploy the subnets"
  type        = string
}

#------------------------------------------------------------------------------------
# variables for security group
#------------------------------------------------------------------------------------
variable "security_group1_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group2_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group3_name" {
  description = "Name of the security group"
  type        = string
}

#------------------------------------------------------------------------------------
# variables for availability zone
#------------------------------------------------------------------------------------
variable "availability_zone" {
  description = "Availability zone for the subnets and VMs"
  type        = string
}
#------------------------------------------------------------------------------------
# variables for Ports/NIC
#------------------------------------------------------------------------------------
variable "ports" {
  description = "Map of port definitions"
  type = map(object({
    subnet_name          = string
    security_group_names = list(string)
  }))
}

#------------------------------------------------------------------------------------
# variables for VMs
#------------------------------------------------------------------------------------
variable "instances" {
  type = list(object({
    name              = string
    flavor            = string
    image_id          = string
    port_names        = list(string)
    availability_zone = string
  }))
  description = "List of ECS instances using defined ports"
}

variable "ssh_key_name" { type = string }



