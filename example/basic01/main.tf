// Zone:
module "cf_zone" {
  source = "../../zone"

  name       = var.name
  paused     = var.paused
  jump_start = var.jump_start
  plan       = var.plan
  type       = var.type

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token
  account_id   = var.account_id
}

// Settings_override:
module "cf_settings_override" {
  source = "../../settings_override"

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token
  account_id   = var.account_id
  
  name     = var.name
  settings = var.settings

}

// Firewall-rules:
module "cf_firewall_rules" {
  source = "../../firewall-rules"

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token
  account_id   = var.account_id

  name           = var.name
  filewall_rules = var.filewall_rules

}

// Access-rules:
module "cf_access_rules" {
  source = "../../access-rules"

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token
  account_id   = var.account_id

  access_rules = var.access_rules
}

// Records: www
module "cf_records" {
  source = "../../records"

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token

  domain_name = var.name
  records     = var.records

}

// page-rules:
module "cf_page_rules" {
  source = "../../page-rules"

  cf_email     = var.cf_email
  cf_api_key   = var.cf_api_key
  cf_api_token = var.cf_api_token
  account_id   = var.account_id

  name       = var.name
  page_rules = var.page_rules

}