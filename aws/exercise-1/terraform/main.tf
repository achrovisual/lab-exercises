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

module "alb" {
  source      = "./modules/alb"
  vpc         = module.vpc.vpc
  vpc_id      = module.vpc.vpc_id
  pub_sub_ids = module.vpc.pub_sub_ids
  asg_sg_id   = module.asg.asg_sg_id
  http_cidr   = var.http_cidr

  common_tags          = local.common_tags
  resource_name_prefix = var.resource_name_prefix
  resource_name_suffix = var.resource_name_suffix
}

module "asg" {
  source        = "./modules/asg"
  vpc_id        = module.vpc.vpc_id
  priv_sub_ids  = module.vpc.priv_sub_ids
  alb_sg_id     = module.alb.alb_sg_id
  alb_tg_arn    = module.alb.alb_tg_arn
  ami           = var.ami
  instance_type = var.instance_type

  common_tags          = local.common_tags
  resource_name_prefix = var.resource_name_prefix
  resource_name_suffix = var.resource_name_suffix
}
