variable "instances" {
  type = list(object({
    name                 = string
    flavor               = string
    image_id             = string
    subnet_names         = list(string) 
    security_group_names = list(string)
    availability_zone    = string  
  }))
  description = "List of instances with multiple subnet and security group names"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name for instances"
}

variable "subnet_ids" {
  type        = map(string)
  description = "Mapping of subnet names to subnet IDs"
}

variable "security_group_ids" {
  type        = map(string)
  description = "Mapping of security group names to security group IDs"
}
