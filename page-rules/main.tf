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

resource "cloudflare_page_rule" "this" {
  for_each = { for rule in var.page_rules: rule.target => rule }

  zone_id  = lookup(data.cloudflare_zones.this.zones[0], "id")
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
    cache_key_fields            = lookup(each.value, "cache_key_fields", null)
    cache_level                 = lookup(each.value, "cache_level", null)
    cache_on_cookie             = lookup(each.value, "cache_on_cookie", null)
    cache_ttl_by_status         = lookup(each.value, "cache_ttl_by_status", null)
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
    smart_errors                = lookup(each.value, "smart_errors", null)
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