variable "ami" {
  description = "ID of the AMI"
  type        = string
}

variable "alb_sg_id" {
  description = "ID of the ALB security group"
}

variable "alb_tg_arn" {
  description = "ARN of the ALB target group"
}

variable "common_tags" {
  description = "Common resource tags to be used"
  type        = map(string)
}

variable "instance_type" {
  description = "Instance type to be used"
  type        = string
}

variable "priv_sub_ids" {
  description = "IDs of the private subnets"
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

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
