
# ssh security group
#----------------------------------------------------
resource "aws_security_group" "ssh_sg" {
  name        = "${var.app_name}-ssh-sg"
  description = "Allow ssh"
  vpc_id      = aws_vpc.vpc.id

  # ssh
  ingress {
    description = "ssh from IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_location]
  }

  tags = {
    Name = "${var.app_name}-ssh-sg"
  }
}

# Web access security group
#----------------------------------------------------
resource "aws_security_group" "web_access_sg" {
  name        = "${var.app_name}-web-access-sg"
  description = "Allow http/https traffic"
  vpc_id      = aws_vpc.vpc.id

  # http
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }
  # https
  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.all_traffic]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.all_traffic]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.app_name}-web-access-sg"
  }
}
