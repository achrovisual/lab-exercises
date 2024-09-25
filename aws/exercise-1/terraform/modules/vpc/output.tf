output "priv_sub_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.exercise_1_priv_sub[*].id
}

output "pub_sub_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.exercise_1_pub_sub[*].id
}

output "vpc" {
  description = "VPC object"
  value       = aws_vpc.exercise_1_vpc
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.exercise_1_vpc.id
}
