output "zone_id" {
  description = "The ID of this zone"
  value       = module.cf_zone.zone_id
}

output "page_rule_ids" {
  description = "The Page rule identifiers"
  value       = module.cf_page_rules.page_rule_ids
}

output "page_rule_targets" {
  description = "The URL pattern targeted by the page rule."
  value       = module.cf_page_rules.page_rule_targets
}

output "page_rule_actions" {
  description = "The actions applied by the page rules."
  value       = module.cf_page_rules.page_rule_actions
}

output "firewall_rule_ids" {
  description = "The firewall rule identifiers"
  value       = module.cf_firewall_rules.firewall_rule_ids
}

output "access_rule_ids" {
  description = "The IDs of access rules"
  value       = module.cf_access_rules.ids
}

output "record_ids" {
  description = "The ID of records"
  value       = module.cf_records.record_ids
}

output "record_hostnames" {
  description = "The hostname of records"
  value       = module.cf_records.record_hostnames
}

output "initial_settings" {
  description = "Settings present in the zone at the time the resource is created."
  value       = module.cf_settings_override.initial_settings
}

output "readonly_settings" {
  description = "Which of the current settings are not able to be set by the user."
  value       = module.cf_settings_override.readonly_settings
}