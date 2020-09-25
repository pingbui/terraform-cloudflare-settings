provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

resource "cloudflare_access_rule" "this" {
  count    = length(var.rule_values)
  notes    = "${var.notes}-${element(var.rule_values, count.index)}"
  mode     = var.mode
  configuration = {
    target = var.target
    value  = element(var.rule_values, count.index)
  }
}
