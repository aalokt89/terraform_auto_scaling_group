# ALB
#----------------------------------------
resource "aws_lb" "web_alb" {
  depends_on         = [aws_subnet.public_subnets, aws_subnet.private_subnets]
  name               = "${var.app_name}-${var.load_balancer_name}"
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.web_access_sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  tags = {
    Name = "${var.app_name}-${var.load_balancer_name}"
  }
}

# ALB target group
#----------------------------------------
resource "aws_lb_target_group" "web_alb_tg" {
  depends_on = [aws_lb.web_alb]
  name       = "${var.app_name}-${var.load_balancer_name}-${var.web_alb_tg_name}"
  port       = var.web_alb_tg_port
  protocol   = var.web_alb_tg_protocol
  vpc_id     = aws_vpc.vpc.id
}

# ALB listener
#----------------------------------------
resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = var.web_alb_listener_port
  protocol          = var.web_alb_listener_protocol

  default_action {
    type             = var.web_alb_listener_action_type
    target_group_arn = aws_lb_target_group.web_alb_tg.arn
  }
}
