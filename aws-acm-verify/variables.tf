variable "cf_email" {
  description = "The email associated with the account."
  type        = string
  default     = null
}

variable "cf_api_key" {
  description = "The Cloudflare API key."
  type        = string
  default     = null
}

variable "cf_api_token" {
  description = "The Cloudflare API Token. This is an alternative to email+api_key. If both are specified, api_token will be used over email+api_key fields."
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The Domain name of these records"
  type        = string
}

variable "verity_certificate" {
  description = "Whether to verify the certificate"
  type        = bool
  default     = true
}

variable "validation_domains" {
  description = "The list of validation domains"
  type        = list(map(string))
  default     = [{}]
}

variable "num_domain_names" {
  description = "The number of domains."
  type        = number
  default     = 1
}

variable "certificate_arn" {
  description = "The arn of the ACM cert"
  type        = string
  default     = ""
}

variable "validation_record_fqdns" {
  description = "The fqdns of records to verify"
  type        = list(string)
  default     = []
}
