resource "aws_vpc" "create_vpc" {
    cidr_block = var.cidr_block

    tags = {
        Name = "exercise-1-vpc"
    }
}

resource "aws_internet_gateway" "create_igw" {
    vpc_id = aws_vpc.create_vpc.id

    tags = {
        Name = "exercise-1-igw"
    }
}   

resource "aws_subnet" "create_public_sub" {
    count = "${length(var.pub_sub_cidr)}"
    vpc_id = aws_vpc.create_vpc.id
    availability_zone = var.sub_az[count.index]
    cidr_block = var.pub_sub_cidr[count.index]

    tags = {
        Name = "exercise-1-pub-sub-${count.index + 1}"
    }
}

resource "aws_subnet" "create_priv_subnet" {
    count               = "${length(var.priv_sub_cidr)}"
    vpc_id              = aws_vpc.create_vpc.id
    availability_zone   = var.sub_az[count.index]
    cidr_block          = var.priv_sub_cidr[count.index]

    tags = {
        Name = "exercise-1-priv-sub-${count.index + 1}"
    }
}