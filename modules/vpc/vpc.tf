
resource "opentelekomcloud_vpc_v1" "vpc" {
  description = "Main VPC for the infrastructure"
  name = var.vpc_name
  cidr = var.vpc_cidr
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet1" {
  name   = var.subnet1_name
  vpc_id = opentelekomcloud_vpc_v1.vpc.id
  cidr   = var.subnet1_cidr
  #gateway_ip = cidrhost(var.vpc_cidr, 1) # this uses the 1st ip of the vpc 
  gateway_ip = cidrhost(var.subnet1_cidr, 1) # this uses the 1st ip of the subnet1
  #az     = var.az
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet2" {
  name   = var.subnet2_name
  vpc_id = opentelekomcloud_vpc_v1.vpc.id
  cidr   = var.subnet2_cidr
  gateway_ip = cidrhost(var.subnet2_cidr, 1)
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet3" {
  name   = var.subnet3_name
  vpc_id = opentelekomcloud_vpc_v1.vpc.id
  cidr   = var.subnet3_cidr
  gateway_ip = cidrhost(var.subnet3_cidr, 1)
}




