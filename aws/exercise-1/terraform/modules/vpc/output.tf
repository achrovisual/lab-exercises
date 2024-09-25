output "vpc" {
  value = aws_vpc.exercise_1_vpc
}

output "vpc_id" {
  value = aws_vpc.exercise_1_vpc.id
}


output "pub_sub_ids" {
  value = aws_subnet.exercise_1_pub_sub[*].id
}

output "priv_sub_ids" {
  value = aws_subnet.exercise_1_priv_sub[*].id
}

