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

output "page_rule_statuses" {
  description = "Whether the page rules are active or disabled."
  value       = values(cloudflare_page_rule.this)[*]["status"]
}
