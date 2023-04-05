# Auto scaling group
#----------------------------------------

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

resource "aws_autoscaling_group" "web_server_asg" {
  name                = "${var.app_name}-web-server-asg"
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  vpc_zone_identifier = tolist(data.aws_subnets.public.ids)

  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }



}
