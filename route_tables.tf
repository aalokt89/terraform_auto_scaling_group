# Edit default route table for public subnets
#----------------------------------------------------
# Public rt
resource "aws_default_route_table" "public_rt" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = var.all_traffic
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name      = "${var.app_name}-public-rt"
    Terraform = "true"
  }
}

# Private rt
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block        = var.all_traffic
    natnat_gateway_id = ""
  }
  tags = {
    Name      = "${var.app_name}-public-rt"
    Terraform = "true"
  }
}

# Create route table associations
#----------------------------------------------------

# Public rt assoc.
resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.public_subnets]
  route_table_id = aws_default_route_table.public_rt.id
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
}

# Private rt assoc.
resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.private_subnets]
  route_table_id = aws_route_table.private_rt.id
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
}
