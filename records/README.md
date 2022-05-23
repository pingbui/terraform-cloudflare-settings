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
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key) | The Cloudflare API key | `string` | `null` | no |
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | The Cloudflare API Token. This is an alternative to email+api\_key. If both are specified, api\_token will be used over email+api\_key fields | `string` | `null` | no |
| <a name="input_cf_email"></a> [cf\_email](#input\_cf\_email) | The email associated with the account | `string` | `null` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The Domain name of these records | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | n/a | `list(any)` | <pre>[<br>  [<br>    "www",<br>    "10.10.10.10",<br>    "0",<br>    "A",<br>    "false",<br>    "1"<br>  ]<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_hostnames"></a> [record\_hostnames](#output\_record\_hostnames) | The hostname of records |
| <a name="output_record_ids"></a> [record\_ids](#output\_record\_ids) | The ID of records |
| <a name="output_zone_ids"></a> [zone\_ids](#output\_zone\_ids) | The ID of zones |
| <a name="output_zone_names"></a> [zone\_names](#output\_zone\_names) | The name of zones |
