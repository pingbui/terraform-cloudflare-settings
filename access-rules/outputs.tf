output "ids" {
  description = "The IDs of these rules"
  value       = cloudflare_access_rule.this.*.id
}
