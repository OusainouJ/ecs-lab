provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "alb_dns" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_record_name
  value   = var.alb_dns_name
  type    = "CNAME"
  ttl     = 300
  proxied = true
}
