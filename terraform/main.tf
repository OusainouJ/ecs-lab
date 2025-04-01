provider "aws" {
  region = var.aws_region
}

module "networking" {
  source             = "./modules/networking"
  availability_zones = ["eu-west-2a", "eu-west-2b"]
  container_port     = var.container_port
}

module "iam" {
  source = "./modules/iam"
}

module "ecr" {
  source = "./modules/ecr"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnets
  container_port    = var.container_port
}

module "ecs_fargate" {
  source                   = "./modules/ecs_fargate"
  task_family              = var.task_family
  cpu                      = var.cpu
  memory                   = var.memory
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  container_image          = "${module.ecr.ecr_repository_url}:latest"
  service_name             = var.service_name
  subnets                  = module.networking.public_subnets
  security_groups          = [module.networking.ecs_sg_id]
  ecs_cluster_name         = var.ecs_cluster_name
  container_name           = var.container_name
  container_port           = var.container_port
  desired_count            = var.desired_count
  alb_target_group_arn     = module.alb.alb_target_group_arn
}

module "cloudflare" {
  source                 = "./modules/cloudflare"
  cloudflare_api_token   = var.cloudflare_api_token
  cloudflare_zone_id     = var.cloudflare_zone_id
  cloudflare_record_name = "tm"  
  alb_dns_name           = module.alb.alb_dns_name
  domain_name            = "ousainoujoof.com"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}
