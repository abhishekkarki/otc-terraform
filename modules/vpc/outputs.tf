# output "vpc_id" {
#   description = "The ID of the created VPC"
#   value       = opentelekomcloud_vpc_v1.vpc.id
# }

output "vpc_id" {
  description = "The ID of the created VPC"
  value = opentelekomcloud_vpc_v1.vpc.id
}

output "subnet_ids" {
  value = {
    "subnet-1" = opentelekomcloud_vpc_subnet_v1.subnet1.id
    "subnet-2" = opentelekomcloud_vpc_subnet_v1.subnet2.id
    "subnet-3" = opentelekomcloud_vpc_subnet_v1.subnet3.id
  }
}



