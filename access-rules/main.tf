provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

resource "cloudflare_access_rule" "this" {
  for_each = { for ar in var.access_rules: ar.value => ar }
  notes    = lookup(each.value, "notes")
  mode     = lookup(each.value, "mode", "whitelist") // "block", "challenge", "whitelist", "js_challenge"
  configuration = {
    target = lookup(each.value, "target", "ip") // "ip", "ip6", "ip_range", "asn", "country"
    value  = lookup(each.value, "value")
  }
}