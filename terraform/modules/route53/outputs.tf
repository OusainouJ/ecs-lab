output "cloudflare_record_id" {
  description = "ID of the Cloudflare DNS record"
  value       = cloudflare_record.alb_dns.id
}
