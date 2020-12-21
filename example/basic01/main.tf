provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

// Zone:
resource "cloudflare_zone" "this" {
  zone       = var.name
  paused     = var.paused
  jump_start = var.jump_start
  plan       = var.plan
  type       = var.type
}

// Settings_override:
module "cf_settings_override" {
  source = "../../settings_override"

  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id
  
  name     = var.name
  settings = var.settings

}

// Firewall-rules:
module "cf_firewall_rules" {
  source = "../../firewall-rules"

  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id

  name           = var.name
  filewall_rules = var.filewall_rules

}

// Access-rules:
module "cf_access_rules" {
  source = "../../access-rules"

  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id

  name         = var.name
  access_rules = var.access_rules
}

// Records: www
module "cf_records" {
  source = "../../records"

  name    = var.name
  records = var.records

}

// page-rules:
module "cf_page_rules" {
  source = "../../page-rules"

  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id

  name       = var.name
  page_rules = var.page_rules

}