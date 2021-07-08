provider "cloudflare" {
  email     = var.cf_email
  api_key   = var.cf_api_key
  api_token = var.cf_api_token
}

## DNS public:
data "cloudflare_zones" "this" {
  filter {
    name   = var.domain_name
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "this" {
  count   = var.verity_certificate ? length(var.validation_domains) : 0
  zone_id = lookup(data.cloudflare_zones.this.zones[0], "id")
  name    = element(var.validation_domains, count.index)["resource_record_name"]
  value   = substr(element(var.validation_domains, count.index)["resource_record_value"], 0, length(element(var.validation_domains, count.index)["resource_record_value"]) - 1)
  type    = element(var.validation_domains, count.index)["resource_record_type"]
  ttl     = 1
  proxied = false
}

resource "aws_acm_certificate_validation" "cloudflare" {
  count                   = var.verity_certificate ? 1 : 0
  certificate_arn         = var.certificate_arn
  validation_record_fqdns = var.validation_record_fqdns
}