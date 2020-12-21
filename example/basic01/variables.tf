variable "cf_email" {
  description = "The email associated with the account"
  type        = string
}

variable "cf_api_key" {
  description = "The Cloudflare API key"
  type        = string
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

variable "paused" {
  description = "Whether this zone is paused (traffic bypasses Cloudflare). Default: false."
  type        = bool
  default     = false
}

variable "jump_start" {
  description = "Whether to scan for DNS records on creation. Ignored after zone is created."
  type        = bool
  default     = false
}

variable "plan" {
  description = "The name of the commercial plan to apply to the zone, can be updated once the one is created; one of free, pro, business, enterprise."
  type        = string
  default     = "free"
}

variable "type" {
  description = "A full zone implies that DNS is hosted with Cloudflare. Valid values: full, partial. Default is partial."
  type        = string
  default     = "partial"
}

variable "filewall_rules" {
  description = "List of rules "
  type        = list(map(any))
  default     = [{}]
}

variable "access_rules" {
  description = "The list of access rules"
  type    = list(map(string))
  default = []
}

variable "page_rules" {
  description = "List of page rules."
  type        = list(map(any))
  default     = [{}]
}

variable "settings" {
  description = "Settings overrides that will be applied to the zone."
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

    // Minify
    css              = "on"
    js               = "on"
    html             = "on"
  }
}

variable "records" {
  description = "DNS Records of this zone."
  type        = list
  default     = []
}