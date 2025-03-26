variable "instances" {
  type = list(object({
    name              = string
    flavor            = string
    image_id          = string
    port_names        = list(string)
    availability_zone = string
  }))
  description = "List of ECS instances using NICs (ports)"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name for instances"
}

variable "ports" {
  description = "Map of port definitions"
  type = map(object({
    subnet_name          = string
    security_group_names = list(string)
  }))
}

variable "subnet_ids" {
  type        = map(string)
  description = "Mapping of subnet names to subnet IDs"
}

variable "security_group_ids" {
  type        = map(string)
  description = "Mapping of security group names to security group IDs"
}
