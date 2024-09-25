variable "ami" {
  description = "ID of the AMI"
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

variable "instance_type" {
  description = "Instance type to be used"
  type        = string
}

variable "lab_name" {
  description = "Lab exercise name for tagging"
  type        = string
}

variable "lab_number" {
  description = "Lab exercise number for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "priv_sub_cidr" {
  description = "CIDR block for the private subnets"
  type        = list(string)
}

variable "pub_sub_cidr" {
  description = "CIDR block for the public subnets"
  type        = list(string)
}

variable "region" {
  description = "AWS region to be used"
  type        = string
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
