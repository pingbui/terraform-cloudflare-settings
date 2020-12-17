output "filter_ids" {
  description = "The Filter identifiers"
  value       = values(cloudflare_filter.this)[*]["id"]
}

output "firewall_rule_ids" {
  description = "The firewall rule identifiers"
  value       = values(cloudflare_firewall_rule.this)[*]["id"]
}