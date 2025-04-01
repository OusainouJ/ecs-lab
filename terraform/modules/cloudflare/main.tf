provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "alb_dns" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_record_name  # The subdomain
  content   = var.alb_dns_name  # ALB DNS Name from AWS
  type    = "CNAME"
  ttl     = 300
  proxied = true  
}

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"  
    }
  }
}