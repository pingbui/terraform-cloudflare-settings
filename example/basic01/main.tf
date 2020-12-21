provider "cloudflare" {
  email      = var.cf_email
  api_key    = var.cf_api_key
  api_token  = var.cf_api_token
  account_id = var.account_id 
}

// Zone:
resource "cloudflare_zone" "this" {
  zone       = var.name
  paused     = var.paused
  jump_start = var.jump_start
  plan       = var.plan
  type       = var.type
}

// Settings_override:
resource "cloudflare_zone_settings_override" "this" {
  zone_id  = cloudflare_zone.this.id
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
    minify        {
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

// Firewall-rules:
resource "cloudflare_filter" "this" {
  for_each    = { for rule in var.filewall_rules: rule.description => rule }
  
  description = lookup(each.value, "description")
  zone_id     = cloudflare_zone.this.id
  paused      = lookup(each.value, "paused", false)
  expression  = lookup(each.value, "expression")
  ref         = lookup(each.value, "ref", null)
}

resource "cloudflare_firewall_rule" "this" {
  for_each    = { for rule in var.filewall_rules: rule.description => rule }

  zone_id     = cloudflare_zone.this.id
  description = lookup(each.value, "description")
  filter_id   = [for ids in values(cloudflare_filter.this)[*]: ids.id if ids.description == lookup(each.value, "description")][0]
  action      = lookup(each.value, "action", "block")
  priority    = lookup(each.value, "priority", null)
  paused      = lookup(each.value, "paused", false)
  products    = lookup(each.value, "products", null) == null ? null : split(",", lookup(each.value, "products"))
}

// Access-rules:
resource "cloudflare_access_rule" "this" {
  for_each = { for ar in var.access_rules: ar.value => ar }
  notes    = lookup(each.value, "notes")
  zone_id  = cloudflare_zone.this.id
  mode     = lookup(each.value, "mode", "whitelist") // "block", "challenge", "whitelist", "js_challenge"
  configuration = {
    target = lookup(each.value, "target", "ip") // "ip", "ip6", "ip_range", "asn", "country"
    value  = lookup(each.value, "value")
  }
}

// Records
resource "cloudflare_record" "this" {
  count    = length(var.records)
  zone_id  = cloudflare_zone.this.id
  name     = element(var.records[count.index], 0)
  value    = element(var.records[count.index], 1)
  priority = element(var.records[count.index], 2)
  type     = element(var.records[count.index], 3)
  proxied  = element(var.records[count.index], 4)
  ttl      = var.cf_ttl
}

// page-rules:
resource "cloudflare_page_rule" "this" {
  for_each = { for rule in var.page_rules: rule.target => rule }

  zone_id  = cloudflare_zone.this.id
  target   = lookup(each.value, "target")
  priority = lookup(each.value, "priority", null)
  status   = lookup(each.value, "status", null)

  actions {
    always_online               = lookup(each.value, "always_online", null)
    always_use_https            = lookup(each.value, "always_use_https", null)
    automatic_https_rewrites    = lookup(each.value, "automatic_https_rewrites", null)
    browser_cache_ttl           = lookup(each.value, "browser_cache_ttl", null)
    bypass_cache_on_cookie      = lookup(each.value, "bypass_cache_on_cookie", null)
    cache_by_device_type        = lookup(each.value, "cache_by_device_type", null)
    cache_deception_armor       = lookup(each.value, "cache_deception_armor", null)
    cache_level                 = lookup(each.value, "cache_level", null)
    cache_on_cookie             = lookup(each.value, "cache_on_cookie", null)
    disable_apps                = lookup(each.value, "disable_apps", null)
    disable_performance         = lookup(each.value, "disable_performance", null)
    disable_railgun             = lookup(each.value, "disable_railgun", null)
    disable_security            = lookup(each.value, "disable_security", null)
    edge_cache_ttl              = lookup(each.value, "edge_cache_ttl", null)
    email_obfuscation           = lookup(each.value, "email_obfuscation", null)
    explicit_cache_control      = lookup(each.value, "explicit_cache_control", null)
    host_header_override        = lookup(each.value, "host_header_override", null)
    ip_geolocation              = lookup(each.value, "ip_geolocation", null)
    mirage                      = lookup(each.value, "mirage", null)
    opportunistic_encryption    = lookup(each.value, "opportunistic_encryption", null)
    origin_error_page_pass_thru = lookup(each.value, "origin_error_page_pass_thru", null)
    polish                      = lookup(each.value, "polish", null)
    resolve_override            = lookup(each.value, "resolve_override", null)
    respect_strong_etag         = lookup(each.value, "respect_strong_etag", null)
    response_buffering          = lookup(each.value, "response_buffering", null)
    rocket_loader               = lookup(each.value, "rocket_loader", null)
    security_level              = lookup(each.value, "security_level", null)
    server_side_exclude         = lookup(each.value, "server_side_exclude", null)
  //smart_errors                = lookup(each.value, "smart_errors", null)
    sort_query_string_for_cache = lookup(each.value, "sort_query_string_for_cache", null)
    ssl                         = lookup(each.value, "ssl", null)
    true_client_ip_header       = lookup(each.value, "true_client_ip_header", null)
    waf                         = lookup(each.value, "waf", null)

    dynamic "forwarding_url" {
      for_each = lookup(each.value, "forwarding_url", null)[*]
      content {
        url         = each.value.forwarding_url
        status_code = lookup(each.value, "forwarding_status_code")
      }
    }

    dynamic "minify" {
      for_each = concat(lookup(each.value, "minify_html", null)[*],lookup(each.value, "minify_css", null)[*],lookup(each.value, "minify_js", null)[*])
      content {
        html = lookup(each.value, "minify_html", null)
        css  = lookup(each.value, "minify_css", null)
        js   = lookup(each.value, "minify_js", null)
      }
    }

  }
}