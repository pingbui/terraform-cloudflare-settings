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

variable "domain_name" {
  description = "The Domain name of these records"
  type        = string
}

variable "records" {
  type    = list
  default = [
    ["www","10.10.10.10","0","A","false"]
  ]
}

variable "cf_ttl" {
  description = "The TTL of these records. Value of 1 is 'automatic'"
  type        = string
  default     = "1"
}
