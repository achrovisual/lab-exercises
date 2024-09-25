resource "aws_lb" "exercise_1_alb" {
  name            = format("%s-%s-%s", var.resource_name_prefix, "alb", var.resource_name_suffix)
  subnets         = var.pub_sub_ids
  security_groups = [aws_security_group.exercise_1_alb_sg.id]

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "alb", var.resource_name_suffix)
    }
  )
}

resource "aws_lb_target_group" "exercise_1_alb_tg" {
  name     = format("%s-%s-%s", var.resource_name_prefix, "alb-tg", var.resource_name_suffix)
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval = 60
    path     = "/"
    port     = 80
    timeout  = 45
    protocol = "HTTP"
    matcher  = "200,202"
  }

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "alb-tg", var.resource_name_suffix)
    }
  )
}

resource "aws_lb_listener" "exercise_1_alb_listener" {
  load_balancer_arn = aws_lb.exercise_1_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.exercise_1_alb_tg.arn
  }
}

resource "aws_security_group" "exercise_1_alb_sg" {
  name        = format("%s-%s-%s", var.resource_name_prefix, "alb-sg", var.resource_name_suffix)
  description = "Security group for application load balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.http_cidr]
  }

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "alb-sg", var.resource_name_suffix)
    }
  )
}

resource "aws_security_group_rule" "exercise_1_alb_rule" {
  type                     = "egress"
  description              = "Allow HTTP traffic"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.exercise_1_alb_sg.id
  source_security_group_id = var.asg_sg_id
}
