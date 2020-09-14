variable "cf_email" {}
variable "cf_api_key" {}
variable "cf_api_token" { default = "" }

variable "account_id" {}
variable "whitelist_ips" {
  type    = list
  default = []
}

variable "notes" {
  type    = string
  default = ""
}
