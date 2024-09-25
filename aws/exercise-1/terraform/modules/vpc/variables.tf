variable "common_tags" {
  type = map(string)
}

variable "priv_sub_cidr" {
  type = list(string)
}

variable "pub_sub_cidr" {
  type = list(string)
}

variable "resource_name_prefix" {
  type = string
}

variable "resource_name_suffix" {
  type = string
}

variable "sub_az" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}
