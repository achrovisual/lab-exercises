variable "asg_sg_id" {
  description = "ID of the ASG security group"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags to be used"
  type        = map(string)
}

variable "http_cidr" {
  description = "CIDR block for the HTTP security group rule"
  type        = string
}

variable "pub_sub_ids" {
  description = "IDs of the public subnets"
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

variable "vpc" {
  description = "VPC object"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
