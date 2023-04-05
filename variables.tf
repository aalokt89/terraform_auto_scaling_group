# environment vars
#---------------------------------------
variable "environment" {
  type    = string
  default = "Dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
# naming vars
#---------------------------------------
variable "app_name" {
  type        = string
  description = "app name prefix for naming"
  default     = "shoppr"
}

# vpc vars
#----------------------------------------
variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostnames"
  default     = true
}

# common cidrs
#----------------------------------------
variable "all_traffic" {
  type        = string
  description = "all all traffic"
  default     = "0.0.0.0/0"
}

variable "NAT_subnet" {
  type        = string
  description = "subnet location for NAT"
  default     = "us"
}

# private subnet vars
#----------------------------------------
variable "private_subnets" {
  default = {
    "private_subnet_1" = 0
    "private_subnet_2" = 1
  }
}

# public subnet vars
#----------------------------------------
variable "public_subnets" {
  default = {
    "public_subnet_1" = 0
    "public_subnet_2" = 1
  }
}
variable "auto_ipv4" {
  type        = bool
  description = "enable auto-assign ipv4"
  default     = true
}

# security group vars
#----------------------------------------
variable "ssh_location" {
  type        = string
  description = "My IP address"
  default     = "0.0.0.0/0"
}

# ec2 vars
#----------------------------------------
variable "web_server_name" {
  type    = string
  default = "web-server"
}
variable "web_server_ami" {
  type        = string
  description = "Instance AMI: Amazon Linux 2"
  default     = "ami-04581fbf744a7d11f"
}
variable "web_server_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair" {
  type        = string
  description = "ec2 key pair"
  default     = "webServer_key"
}

variable "user_data_file" {
  type        = string
  description = "user data file path"
  default     = "install_httpd.sh"
}

# ASG vars
#----------------------------------------
variable "web_asg_capacity" {
  type        = map(any)
  description = "min, max, and desired instance capacity"
  default = {
    "min"     = 2
    "max"     = 2
    "desired" = 2
  }
}
