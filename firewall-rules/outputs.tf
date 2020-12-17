output "filter_ids" {
  description = "The Filter identifiers"
  value       = values(cloudflare_filter.this)[*]["id"]
}