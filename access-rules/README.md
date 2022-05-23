## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.39 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.15.0 |

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_rules"></a> [access\_rules](#input\_access\_rules) | The list of access rules | `list(map(string))` | `[]` | no |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Configure API client with this account ID, so calls use the account API rather than the (default) user API. | `string` | `null` | no |
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key) | The Cloudflare API key. | `string` | `null` | no |
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | The Cloudflare API Token. This is an alternative to email+api\_key. If both are specified, api\_token will be used over email+api\_key fields. | `string` | `null` | no |
| <a name="input_cf_email"></a> [cf\_email](#input\_cf\_email) | The email associated with the account. | `string` | `null` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The DNS zone to which the access rule should be added. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | The IDs of these rules |
