terraform {
  backend "s3" {
    bucket       = "ecs-assingment"
    key          = "terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}