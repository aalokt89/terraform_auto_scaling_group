output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnets" {
  description = "Public subnets"
  value = [
    for subnet in aws_subnet.private_subnets : {
      "id" = "${subnet.id}"
    }
  ]
}

output "private_subnets" {
  description = "Private subnets"
  value = [
    for subnet in aws_subnet.private_subnets : {
      "id" = "${subnet.id}"
    }
  ]
}

output "eip" {
  description = "Elastic IP: Public"
  value       = aws_eip.eip.public_ip
}

output "alb_dns" {
  description = "ALB public DNS"
  value       = aws_lb.web_alb.dns_name
}



