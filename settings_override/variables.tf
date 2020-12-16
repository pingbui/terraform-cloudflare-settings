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

variable "name" {
  description = "The DNS zone name to which apply settings."
  type        = string
}

variable "settings" {
  description = "Settings overrides that will be applied to the zone. "
  type        = any
  default     = {
    // Crypto:
    always_use_https = "on"
    ssl              = "flexible"
    http3            = "on"
    tls_1_3          = "on"
    min_tls_version  = "1.0"

    // Security:
    security_level   = "high"
    challenge_ttl    = "1800"

    // Speed:
    always_online    = "on"
    brotli           = "on"
    // minify
    css              = "on"
    js               = "on"
    html             = "on"
  }
}