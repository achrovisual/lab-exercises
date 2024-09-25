locals {
  common_tags = {
    LAB_NAME   = var.lab_name
    LAB_NUMBER = var.lab_number
  }
}

module "vpc" {
  source        = "./modules/vpc"
  vpc_cidr      = var.vpc_cidr
  pub_sub_cidr  = var.pub_sub_cidr
  priv_sub_cidr = var.priv_sub_cidr
  sub_az        = var.sub_az

  common_tags          = local.common_tags
  resource_name_prefix = var.resource_name_prefix
  resource_name_suffix = var.resource_name_suffix
}
