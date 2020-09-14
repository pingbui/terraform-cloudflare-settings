output "ids" {
  description = "The IDs of these whitelists"
  value       = cloudflare_access_rule.whitelists.*.id
}
