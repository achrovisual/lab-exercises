variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "pub_sub_cidr" {
  type = list(string)
}

variable "priv_sub_cidr" {
  type = list(string)
}

variable "sub_az" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

variable "resource_name_prefix" {
  type = string
}

variable "resource_name_suffix" {
  type = string
}

variable "lab_name" {
  type = string
}

variable "lab_number" {
  type = string
}

variable "http_cidr" {

}
