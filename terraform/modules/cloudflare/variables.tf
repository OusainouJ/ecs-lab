variable "cloudflare_api_token" {
  description = "API token for Cloudflare"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "cloudflare_record_name" {
  description = "The subdomain or record to be updated"
  type        = string
}

variable "alb_dns_name" {
  description = "The AWS ALB DNS name"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for SSL"
  type        = string
}