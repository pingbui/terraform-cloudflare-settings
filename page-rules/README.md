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
| [cloudflare_page_rule.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule) | resource |
| [cloudflare_zones.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Configure API client with this account ID, so calls use the account API rather than the (default) user API. | `string` | `null` | no |
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key) | The Cloudflare API key. | `string` | `null` | no |
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | The Cloudflare API Token. This is an alternative to email+api\_key. If both are specified, api\_token will be used over email+api\_key fields | `string` | `null` | no |
| <a name="input_cf_email"></a> [cf\_email](#input\_cf\_email) | The email associated with the account. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The Domain name of these records. | `string` | n/a | yes |
| <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules) | List of page rules. | `list(map(any))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_page_rule_actions"></a> [page\_rule\_actions](#output\_page\_rule\_actions) | The actions applied by the page rules. |
| <a name="output_page_rule_ids"></a> [page\_rule\_ids](#output\_page\_rule\_ids) | The Page rule identifiers |
| <a name="output_page_rule_statuses"></a> [page\_rule\_statuses](#output\_page\_rule\_statuses) | Whether the page rules are active or disabled. |
| <a name="output_page_rule_targets"></a> [page\_rule\_targets](#output\_page\_rule\_targets) | The URL pattern targeted by the page rule. |
