# Create Internet Gateway
#----------------------------------------------------
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.app_name}-igw"
    Environment = var.environment
    Terraform   = true
  }
}
