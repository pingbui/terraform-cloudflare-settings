provider "cloudflare" {
  email     = var.cf_email
  api_key   = var.cf_api_key
  api_token = var.cf_api_token
}

data "cloudflare_zones" "this" {
  filter {
    name   = var.domain_name
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "this" {
  for_each = { for rs in toset(var.records) : "${rs[0]} ${rs[3]} ${rs[1]}" => rs }
  zone_id  = lookup(data.cloudflare_zones.this.zones[0], "id")
  name     = element(each.value, 0)
  value    = element(each.value, 1)
  priority = element(each.value, 2)
  type     = element(each.value, 3)
  proxied  = element(each.value, 4)
  ttl      = element(each.value, 5)
}
