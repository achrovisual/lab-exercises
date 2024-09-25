resource "aws_launch_template" "create_launch_template" {
    name_prefix   = "exercise-1-launch-template"
    image_id = "ami-05134c8ef96964280"
    instance_type = "t2.micro"

    network_interfaces {
        associate_public_ip_address = false
    }
}

resource "aws_autoscaling_group" "asg" {
    name = "app-asg"
    max_size = 0
    min_size = 0
    desired_capacity = 0
    vpc_zone_identifier = [aws_subnet.pub_sub_1.id, aws_subnet.pub_sub_2.id]
    target_group_arns = [aws_lb_target_group.alb_tg.arn]

    launch_template {
        id = aws_launch_template.launch_template.id
        version = "$Latest"
    }
}
