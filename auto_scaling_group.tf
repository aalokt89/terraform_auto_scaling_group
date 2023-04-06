# Auto scaling group
#----------------------------------------
resource "aws_autoscaling_group" "web_server_asg" {
  depends_on          = [aws_subnet.public_subnets, aws_subnet.private_subnets, aws_lb.web_alb]
  name                = "${var.app_name}-web-server-asg"
  min_size            = var.web_asg_capacity["min"]
  max_size            = var.web_asg_capacity["max"]
  vpc_zone_identifier = [for subnet in aws_subnet.private_subnets : subnet.id]
  target_group_arns   = [aws_lb_target_group.web_alb_tg_http.arn]
  health_check_type   = var.web_asg_health_check_type

  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }
}

# Scaling policy
resource "aws_autoscaling_policy" "web_server_asg" {
  name                   = "${var.app_name}-asg-scaling-policy"
  policy_type            = var.web_asg_scaling_policy["policy_type"]
  autoscaling_group_name = aws_autoscaling_group.web_server_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.web_asg_scaling_policy["metric_type"]
    }

    target_value = var.web_asg_scaling_policy["target_value"]
  }
}
