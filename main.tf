module "vpc" {
  source       = "./modules/vpc"
  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr
  subnet1_name = var.subnet1_name
  subnet1_cidr = var.subnet1_cidr
  subnet2_name = var.subnet2_name
  subnet2_cidr = var.subnet2_cidr
  subnet3_name = var.subnet3_name
  subnet3_cidr = var.subnet3_cidr
  az           = var.az
  providers = {
    opentelekomcloud = opentelekomcloud
  }
}
#------------------------------------------------------------------------------------

module "security_group" {
  source               = "./modules/security_group"
  vpc_id               = module.vpc.vpc_id
  security_group1_name = var.security_group1_name
  security_group2_name = var.security_group2_name
  security_group3_name = var.security_group3_name
  providers = {
    opentelekomcloud = opentelekomcloud
  }
}
#------------------------------------------------------------------------------------

module "compute" {
  source             = "./modules/compute"
  instances          = var.instances
  ssh_key_name       = var.ssh_key_name
  ports              = var.ports
  subnet_ids         = module.vpc.subnet_ids
  security_group_ids = module.security_group.security_group_ids
}
#------------------------------------------------------------------------------------
