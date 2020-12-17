provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

data "cloudflare_zones" "this" {
  filter {
    name = var.name
  }
}

resource "cloudflare_filter" "this" {
  for_each = { for rule in var.filewall_rules: rule.description => rule }
  
  description = lookup(each.value, "description")
  zone_id     = lookup(data.cloudflare_zones.this.zones[0], "id")
  paused      = lookup(each.value, "paused", false)
  expression  = lookup(each.value, "expression")
  ref         = lookup(each.value, "ref", null)
}