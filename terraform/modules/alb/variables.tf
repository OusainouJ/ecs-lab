variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
}

variable "container_port" {
  description = "The port the ECS container listens on"
  type        = number
  default = 3000
}
