output "zone_id" {
  description = "The zone_id of this Zone applied this settings"
  value       = lookup(data.cloudflare_zones.this.zones[0], "id")
}

output "initial_settings" {
  description = "Settings present in the zone at the time the resource is created."
  value       = cloudflare_zone_settings_override.this.initial_settings
}

output "readonly_settings" {
  description = "Which of the current settings are not able to be set by the user."
  value       = cloudflare_zone_settings_override.this.readonly_settings
}

output "initial_settings_read_at" {
  description = "Time when this resource was created and the initial_settings were set."
  value       = cloudflare_zone_settings_override.this.initial_settings_read_at
}
