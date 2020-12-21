output "zone_id" {
  description = "The ID of this zone"
  value       = cloudflare_zone.this.id
}