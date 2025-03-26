# variable "vpc_name" {
#   description = "Name of the VPC"
#   type        = string
# }

# variable "vpc_cidr" {
#   description = "CIDR block for the VPC"
#   type        = string
# }

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
