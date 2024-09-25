resource "aws_autoscaling_group" "exercise_1_asg" {
  name                = format("%s-%s-%s", var.resource_name_prefix, "asg", var.resource_name_suffix)
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = var.priv_sub_ids

  launch_template {
    id      = aws_launch_template.exercise_1_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = format("%s-%s-%s", var.resource_name_prefix, "asg-ec2-instance", var.resource_name_suffix)
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.common_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_attachment" "exercise_1_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.exercise_1_asg.id
  lb_target_group_arn    = var.alb_tg_arn
}

resource "aws_launch_template" "exercise_1_lt" {
  name                   = format("%s-%s-%s", var.resource_name_prefix, "lt", var.resource_name_suffix)
  image_id               = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.exercise_1_asg_sg.id]

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "lt", var.resource_name_suffix)
    }
  )
}

resource "aws_security_group" "exercise_1_asg_sg" {
  name        = format("%s-%s-%s", var.resource_name_prefix, "asg-sg", var.resource_name_suffix)
  description = "Security group for auto scaling group"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.alb_sg_id]
  }

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s", var.resource_name_prefix, "asg-sg", var.resource_name_suffix)
    }
  )
}
