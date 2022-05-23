## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.39 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_rule.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_rule) | resource |
| [cloudflare_filter.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/filter) | resource |
| [cloudflare_firewall_rule.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/firewall_rule) | resource |
| [cloudflare_page_rule.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule) | resource |
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_zone_settings_override.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_rules"></a> [access\_rules](#input\_access\_rules) | The list of access rules | `list(map(string))` | `[]` | no |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Configure API client with this account ID, so calls use the account API rather than the (default) user API. | `string` | `null` | no |
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key) | The Cloudflare API key | `string` | `null` | no |
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | The Cloudflare API Token. This is an alternative to email+api\_key. If both are specified, api\_token will be used over email+api\_key fields | `string` | `null` | no |
| <a name="input_cf_email"></a> [cf\_email](#input\_cf\_email) | The email associated with the account | `string` | `null` | no |
| <a name="input_filewall_rules"></a> [filewall\_rules](#input\_filewall\_rules) | List of rules | `list(map(any))` | `[]` | no |
| <a name="input_jump_start"></a> [jump\_start](#input\_jump\_start) | Whether to scan for DNS records on creation. Ignored after zone is created. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The Domain name of these records | `string` | n/a | yes |
| <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules) | List of page rules. | `list(map(any))` | `[]` | no |
| <a name="input_paused"></a> [paused](#input\_paused) | Whether this zone is paused (traffic bypasses Cloudflare). Default: false. | `bool` | `false` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | The name of the commercial plan to apply to the zone, can be updated once the one is created; one of free, pro, business, enterprise. | `string` | `"free"` | no |
| <a name="input_records"></a> [records](#input\_records) | DNS Records of this zone. | `list(any)` | `[]` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Settings overrides that will be applied to the zone. | `any` | <pre>{<br>  "always_online": "on",<br>  "always_use_https": "on",<br>  "brotli": "on",<br>  "challenge_ttl": "1800",<br>  "css": "on",<br>  "html": "on",<br>  "http3": "on",<br>  "js": "on",<br>  "min_tls_version": "1.0",<br>  "security_level": "high",<br>  "ssl": "flexible",<br>  "tls_1_3": "on"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | A full zone implies that DNS is hosted with Cloudflare. Valid values: full, partial. Default is full. | `string` | `"full"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_rule_ids"></a> [access\_rule\_ids](#output\_access\_rule\_ids) | The IDs of access rules |
| <a name="output_filter_ids"></a> [filter\_ids](#output\_filter\_ids) | The Filter identifiers |
| <a name="output_firewall_rule_ids"></a> [firewall\_rule\_ids](#output\_firewall\_rule\_ids) | The firewall rule identifiers |
| <a name="output_initial_settings"></a> [initial\_settings](#output\_initial\_settings) | Settings present in the zone at the time the resource is created. |
| <a name="output_page_rule_actions"></a> [page\_rule\_actions](#output\_page\_rule\_actions) | The actions applied by the page rules. |
| <a name="output_page_rule_ids"></a> [page\_rule\_ids](#output\_page\_rule\_ids) | The Page rule identifiers |
| <a name="output_page_rule_targets"></a> [page\_rule\_targets](#output\_page\_rule\_targets) | The URL pattern targeted by the page rule. |
| <a name="output_readonly_settings"></a> [readonly\_settings](#output\_readonly\_settings) | Which of the current settings are not able to be set by the user. |
| <a name="output_record_hostnames"></a> [record\_hostnames](#output\_record\_hostnames) | The hostname of records |
| <a name="output_record_ids"></a> [record\_ids](#output\_record\_ids) | The ID of records |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ID of this zone |
