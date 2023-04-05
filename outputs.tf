output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

data "aws_subnet_ids" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Subnet" = "Public"
  }
}

output "public_subnets" {
  value = tolist(data.aws_subnet_ids.public.ids)
}

output "eip" {
  description = "Elastic IP: Public"
  value       = aws_eip.eip.public_ip
}

