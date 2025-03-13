resource "aws_ecs_cluster" "app_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "app_task" {
  family                   = var.task_family
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.ecs_task_execution_role_arn
  container_definitions    = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}