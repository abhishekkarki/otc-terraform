output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

# output "security_group_id" {
#   description = "The ID of the created security group"
#   value       = module.security_group.security_group_id
# }
