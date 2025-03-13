# terraform/modules/ecs_fargate/variables.tf

variable "task_family" {
  description = "The family name for the ECS task"
  type        = string
}

variable "cpu" {
  description = "The CPU units for the ECS task"
  type        = string
}

variable "memory" {
  description = "The memory for the ECS task"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "The ARN of the ECS task execution role"
  type        = string
}

variable "container_image" {
  description = "The Docker image for the container"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "subnets" {
  description = "The subnets for the ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups for the ECS service"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_port" {
  description = "The port the container will listen on"
  type        = number
}

variable "desired_count" {
  description = "The desired number of ECS tasks"
  type        = number
}
variable "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  type        = string
}