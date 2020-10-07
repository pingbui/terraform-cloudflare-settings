output "ids" {
  description = "The IDs of these rules"
  value       = values(cloudflare_access_rule.this)[*]["id"]
}
