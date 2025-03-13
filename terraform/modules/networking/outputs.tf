output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "ecs_sg_id" {
  description = "ID of the ECS security group"
  value       = aws_security_group.ecs_sg.id
}
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}