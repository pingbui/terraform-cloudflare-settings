output "zone_id" {
  description = "The ID of this zone"
  value       = cloudflare_zone.this.id
}

output "page_rule_ids" {
  description = "The Page rule identifiers"
  value       = values(cloudflare_page_rule.this)[*]["id"]
}

output "page_rule_targets" {
  description = "The URL pattern targeted by the page rule."
  value       = values(cloudflare_page_rule.this)[*]["target"]
}

output "page_rule_actions" {
  description = "The actions applied by the page rules."
  value       = values(cloudflare_page_rule.this)[*]["actions"]
}

output "filter_ids" {
  description = "The Filter identifiers"
  value       = values(cloudflare_filter.this)[*]["id"]
}

output "firewall_rule_ids" {
  description = "The firewall rule identifiers"
  value       = values(cloudflare_firewall_rule.this)[*]["id"]
}

output "access_rule_ids" {
  description = "The IDs of access rules"
  value       = values(cloudflare_access_rule.this)[*]["id"]
}

output "record_ids" {
  description = "The ID of records"
  value       = values(cloudflare_record.this)[*]["id"]
}

output "record_hostnames" {
  description = "The hostname of records"
  value       = values(cloudflare_record.this)[*]["hostname"]
}

output "initial_settings" {
  description = "Settings present in the zone at the time the resource is created."
  value       = cloudflare_zone_settings_override.this.initial_settings
}

output "readonly_settings" {
  description = "Which of the current settings are not able to be set by the user."
  value       = cloudflare_zone_settings_override.this.readonly_settings
}
