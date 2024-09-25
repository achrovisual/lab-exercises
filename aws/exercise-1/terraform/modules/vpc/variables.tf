variable "common_tags" {
  description = "Common resource tags to be used"
  type        = map(string)
}

variable "priv_sub_cidr" {
  description = "CIDR block for the private subnets"
  type        = list(string)
}

variable "pub_sub_cidr" {
  description = "CIDR block for the public subnets"
  type        = list(string)
}

variable "resource_name_prefix" {
  description = "Prefix for the resource names"
  type        = string
}

variable "resource_name_suffix" {
  description = "Suffix for the resource names"
  type        = string
}

variable "sub_az" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
