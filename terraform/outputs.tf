output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "bastion_public_ip" {
  description = "Public IP (Elastic IP) of the Bastion host"
  value       = aws_eip.bastion.public_ip
}

output "backend_private_ip" {
  description = "Private IP of the Backend EC2 instance"
  value       = aws_instance.backend.private_ip
}

output "mongo_private_ip" {
  description = "Private IP of the MongoDB EC2 instance"
  value       = aws_instance.mongo.private_ip
}