output "zone_ids" {
  description = "The ID of zones"
  value       = data.cloudflare_zones.this.zones.*.id
}

output "zone_names" {
  description = "The name of zones"
  value       = data.cloudflare_zones.this.zones.*.name
}

output "record_ids" {
  description = "The ID of records"
  value       = cloudflare_record.this.*.id
}

output "record_hostnames" {
  description = "The hostname of records"
  value       = cloudflare_record.this.*.hostname
}
