provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

resource "cloudflare_access_rule" "whitelists" {
  count    = length(var.whitelist_ips)
  notes    = "${var.notes}-${element(var.whitelist_ips, count.index)}"
  mode     = "whitelist"
  configuration = {
    target = "ip"
    value  = element(var.whitelist_ips, count.index)
  }
}
