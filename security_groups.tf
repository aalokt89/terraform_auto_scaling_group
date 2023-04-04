# # Deploy asg security groups
# #----------------------------------------------------
# resource "aws_security_group" "asg_sg" {
#   name        = "${var.app_name}-${var.asg_name}-sg"
#   description = "Allow ssh and http/https traffic"
#   vpc_id      = aws_vpc.vpc.id

#   # ssh
#   ingress {
#     description = "ssh from IP"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = [var.ssh_location]
#   }
#   # ht
#   ingress {
#     description = "http"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [var.all_traffic]
#   }
#   # https
#   ingress {
#     description = "https"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = [var.all_traffic]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = [var.all_traffic]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name        = "${var.app_name}-${var.asg}-sg"
#     Environment = var.environment
#     Terraform   = "true"
#   }
# }