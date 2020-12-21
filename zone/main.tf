provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

resource "cloudflare_zone" "this" {
  zone       = var.name
  paused     = var.paused
  jump_start = var.jump_start
  plan       = var.plan
  type       = var.type
}