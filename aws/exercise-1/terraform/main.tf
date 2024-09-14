module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
    pub_sub_cidr = var.pub_sub_cidr
    priv_sub_cidr = var.priv_sub_cidr
    sub_az = var.sub_az
}