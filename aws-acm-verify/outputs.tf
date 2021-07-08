output "ids" {
  description = "The IDs of these records."
  value       = cloudflare_record.this.*.id
}