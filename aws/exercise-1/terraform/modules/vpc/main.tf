resource "aws_vpc" "exercise_1_vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "vpc", var.resource_name_suffix)
    }
  )
}

resource "aws_internet_gateway" "exercise_1_igw" {
  vpc_id = aws_vpc.exercise_1_vpc.id

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "igw", var.resource_name_suffix)
    }
  )
}

resource "aws_subnet" "exercise_1_pub_sub" {
  count             = length(var.pub_sub_cidr)
  vpc_id            = aws_vpc.exercise_1_vpc.id
  availability_zone = var.sub_az[count.index]
  cidr_block        = var.pub_sub_cidr[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "pub-sub", var.resource_name_suffix)
    }
  )
}

resource "aws_subnet" "exercise_1_priv_sub" {
  count             = length(var.priv_sub_cidr)
  vpc_id            = aws_vpc.exercise_1_vpc.id
  availability_zone = var.sub_az[count.index]
  cidr_block        = var.priv_sub_cidr[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "priv-sub", var.resource_name_suffix)
    }
  )
}

resource "aws_route_table" "exercise_1_pub_rt" {
  vpc_id = aws_vpc.exercise_1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.exercise_1_igw.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "pub-rt", var.resource_name_suffix)
    }
  )
}

resource "aws_route_table" "exercise_1_priv_rt" {
  vpc_id = aws_vpc.exercise_1_vpc.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "priv-rt", var.resource_name_suffix)
    }
  )
}

resource "aws_route_table_association" "exercise_1_pub_sub_rt_assoc" {
  count          = length(var.pub_sub_cidr)
  subnet_id      = aws_subnet.exercise_1_pub_sub[count.index].id
  route_table_id = aws_route_table.exercise_1_pub_rt.id
}

resource "aws_route_table_association" "exercise_1_priv_sub_rt_assoc" {
  count          = length(var.priv_sub_cidr)
  subnet_id      = aws_subnet.exercise_1_priv_sub[count.index].id
  route_table_id = aws_route_table.exercise_1_priv_rt.id
}
