## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.39 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 2.21 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_zone_settings_override.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |
| [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Configure API client with this account ID, so calls use the account API rather than the (default) user API. | `string` | `null` | no |
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key) | The Cloudflare API key. | `string` | `null` | no |
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | The Cloudflare API Token. This is an alternative to email+api\_key. If both are specified, api\_token will be used over email+api\_key fields. | `string` | `null` | no |
| <a name="input_cf_email"></a> [cf\_email](#input\_cf\_email) | The email associated with the account. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The DNS zone name to which apply settings. | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Settings overrides that will be applied to the zone. | `any` | <pre>{<br>  "always_online": "on",<br>  "always_use_https": "on",<br>  "brotli": "on",<br>  "challenge_ttl": "1800",<br>  "css": "on",<br>  "html": "on",<br>  "http3": "on",<br>  "js": "on",<br>  "min_tls_version": "1.0",<br>  "security_level": "high",<br>  "ssl": "flexible",<br>  "tls_1_3": "on"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_initial_settings"></a> [initial\_settings](#output\_initial\_settings) | Settings present in the zone at the time the resource is created. |
| <a name="output_initial_settings_read_at"></a> [initial\_settings\_read\_at](#output\_initial\_settings\_read\_at) | Time when this resource was created and the initial\_settings were set. |
| <a name="output_readonly_settings"></a> [readonly\_settings](#output\_readonly\_settings) | Which of the current settings are not able to be set by the user. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The zone\_id of this Zone applied this settings |
