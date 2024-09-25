output "asg_sg_id" {
  description = "ID of the ASG security group"
  value       = aws_security_group.exercise_1_asg_sg.id
}
