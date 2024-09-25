output "alb_sg_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.exercise_1_alb_sg.id
}

output "alb_tg_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.exercise_1_alb_tg.arn
}
