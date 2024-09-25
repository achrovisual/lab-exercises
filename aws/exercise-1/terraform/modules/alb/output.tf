output "alb_tg_arn" {
  value = aws_lb_target_group.exercise_1_alb_tg.arn
}

output "alb_sg_id" {
  value = aws_security_group.exercise_1_alb_sg.id
}
