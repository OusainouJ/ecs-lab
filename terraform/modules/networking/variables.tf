variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" 
}

variable "public_subnet_cidrs" {
  description = "The CIDR block of the Public subnet"
  type        = list(string)
  default     = [ "10.0.0.0/24", "10.0.16.0/24" ]
}

variable "private_subnet_cidrs" {
  description = "The CIDR block of the Private subnet"
  type = list(string)
  default = [ "10.0.128.0/24", "10.0.144.0/24" ]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-2b", "eu-west-2a"]
}