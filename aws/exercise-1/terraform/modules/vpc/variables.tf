variable "cidr_block" {
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