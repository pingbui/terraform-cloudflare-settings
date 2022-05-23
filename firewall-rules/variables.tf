variable "cf_email" {
  description = "The email associated with the account"
  type        = string
  default     = null
}

variable "cf_api_key" {
  description = "The Cloudflare API key"
  type        = string
  default     = null
}

variable "cf_api_token" {
  description = "The Cloudflare API Token. This is an alternative to email+api_key. If both are specified, api_token will be used over email+api_key fields"
  type        = string
  default     = null
}

variable "account_id" {
  description = "Configure API client with this account ID, so calls use the account API rather than the (default) user API."
  type        = string
  default     = null
}

variable "name" {
  description = "The Domain name of these records"
  type        = string
}

variable "filewall_rules" {
  description = "List of rules "
  type        = list(map(any))
  default     = []
}
