variable "cf_email" {
  description = "The email associated with the account."
  type        = string
}

variable "cf_api_key" {
  description = "The Cloudflare API key."
  type        = string
}

variable "cf_api_token" { 
  description = "The Cloudflare API Token. This is an alternative to email+api_key. If both are specified, api_token will be used over email+api_key fields."
  type        = string
  default     = null
}

variable "account_id" {
  description = "Configure API client with this account ID, so calls use the account API rather than the (default) user API."
  type        = string
  default     = null
}

variable "zone_id" {
  description = "Configure API client with this account ID, so calls use the account API rather than the (default) user API."
  type        = string
  default     = null
}

variable "access_rules" {
  description = "The list of access rules"
  type    = list(map(string))
  default = []
}