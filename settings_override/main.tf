provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id
}

data "cloudflare_zones" "this" {
  filter {
    name = var.name
  }
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = lookup(data.cloudflare_zones.this.zones[0], "id")
  settings {
    // Crypto:
    always_use_https = lookup(var.settings, "always_use_https", "on")
    ssl              = lookup(var.settings, "ssl", "flexible")
    http2            = lookup(var.settings, "http2", null)
    http3            = lookup(var.settings, "http3", "on")
    tls_1_3          = lookup(var.settings, "tls_1_3", "on")
    min_tls_version  = lookup(var.settings, "min_tls_version", "1.0")

    // Cache:
    cache_level       = lookup(var.settings, "cache_level", null)
    browser_cache_ttl = lookup(var.settings, "browser_cache_ttl", "0")

    // Security:
    security_level = lookup(var.settings, "security_level", "high")
    challenge_ttl  = lookup(var.settings, "challenge_ttl", "1800")

    // Speed:
    always_online = lookup(var.settings, "always_online", "on")
    brotli        = lookup(var.settings, "brotli", "on")
    polish        = lookup(var.settings, "polish", null)
    minify {
      css  = lookup(var.settings, "css", "on")
      js   = lookup(var.settings, "js", "on")
      html = lookup(var.settings, "html", "on")
    }

    // Others:
    max_upload        = lookup(var.settings, "max_upload", "100")
    cname_flattening  = lookup(var.settings, "cname_flattening", null)
    h2_prioritization = lookup(var.settings, "h2_prioritization", "off")
  }
}
