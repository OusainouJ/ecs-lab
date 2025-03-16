
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "task_family" {
  description = "The family name for the ECS task"
  type        = string
  default     = "my-app-task"
}

variable "cpu" {
  description = "The CPU units for the ECS task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The memory for the ECS task"
  type        = string
  default     = "512"
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-app-service"
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-app-service"
}

variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "my-container"
}

variable "container_port" {
  description = "The port the container will listen on"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "The desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "cloudflare_api_token" {
  description = "API token for Cloudflare"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}
