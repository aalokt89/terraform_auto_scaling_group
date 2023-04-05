# Get all public subnet ids
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc.id]
  }

  tags = {
    "Subnet" = "Public"
  }
}

# Auto scaling group
#----------------------------------------
resource "aws_autoscaling_group" "web_server_asg" {
  name                = "${var.app_name}-web-server-asg"
  min_size            = var.web_asg_capacity["min"]
  max_size            = var.web_asg_capacity["max"]
  desired_capacity    = var.web_asg_capacity["desired"]
  vpc_zone_identifier = tolist(data.aws_subnets.public.ids)

  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }
}

