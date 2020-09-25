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

variable "notes" {
  description = "(Optional) A personal note about the rule. Typically used as a reminder or explanation for the rule."
  type        = string
  default     = ""
}

variable "mode" {
  description = "(Required) The action to apply to a matched request. Allowed values: "block", "challenge", "whitelist", "js_challenge""
  type        = string
  default     = "whitelist"
}

variable "target" {
  description = "(Required) The request property to target. Allowed values: "ip", "ip6", "ip_range", "asn", "country""
  type        = string
  default     = "ip"
}

variable "rule_values" {
  description = "The list of values to target. Depends on target's type."
  type    = list
  default = []
}