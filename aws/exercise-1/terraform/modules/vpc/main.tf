resource "aws_vpc" "create_vpc" {
    cidr_block = var.cidr_block

    tags = {
        Name = "exercise-1-vpc"
    }
}