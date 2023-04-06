# Auto scaling group
#----------------------------------------
resource "aws_autoscaling_group" "web_server_asg" {
  depends_on          = [aws_subnet.public_subnets, aws_subnet.private_subnets]
  name                = "${var.app_name}-web-server-asg"
  min_size            = var.web_asg_capacity["min"]
  max_size            = var.web_asg_capacity["max"]
  desired_capacity    = var.web_asg_capacity["desired"]
  vpc_zone_identifier = [for subnet in aws_subnet.private_subnets : subnet.id]
  target_group_arns   = [aws_lb_target_group.web_alb_tg_http.arn, aws_lb_target_group.web_alb_tg_https.arn]

  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }
}
