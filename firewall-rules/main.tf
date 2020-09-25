provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

resource "cloudflare_filter" "this" {
  count    = length(var.filewall_rules)

}
