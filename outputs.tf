output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "eip" {
  description = "Elastic IP: Public"
  value       = aws_eip.eip.public_ip
}
