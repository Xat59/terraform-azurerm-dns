<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-dns

Terraform module to manage public or private Azure DNS zone, and DNS records.

Whatever the way you choose to create the DNS zone, you can create and manage records in both **public and private** DNS zone by setting `public_dns_zone` attribute.

You can use this module to manage records of an **existing DNS zone** by setting `create_dns_zone` to `false`.
Or, you can use this module to **create the DNS zone** for you, then manage records within, by setting `create_dns_zone` to `true`.

Anyway, you must set `public_dns_zone` to `true` if you want to manage a private DNS zone, and you must set `public_dns_zone` to `false` if you want to manage a public DNS zone.

## Features

### Create the DNS zone

You can choose to create or not the DNS zone by changing the boolean `create_dns_zone` (default to `true`).
If set to `true`, then it creates the DNS zone with specified records within.
If set to `false`, then it only handle records in the specified DNS zone.

When you choose to create the DNS zone, then you must configure the `soa_record` according to the official [Azure SOA record block](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#soa_record) from the official Azure DNS zone.

### Manage DNS records

You can manage several DNS records in the specified DNS zone :

- `A` records by manipulating `a_records` variable. Record is based on the official [Azure `A` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record)
- `AAAA` records by manipulating `aaaa_records` variable. Record is based on the official [Azure `AAAA` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record)
- `MX` records by manipulating `mx_records` variable. Record is based on the official [Azure `MX` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record)
- `SRV` records by manipulating `srv_records` variable. Record is based on the official [Azure `SRV` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record)
- `SOA` record is a special record and unique for the specified DNS zone. It can be managed only if you also choose to create the DNS zone. Check `Create the DNS zone` paragraph.

## Usage

Take a look at the [`examples` directory](./examples/) to have example usage.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_a_record.a_record_public_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_a_record.a_record_public_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_aaaa_record.aaaa_record_public_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_aaaa_record.aaaa_record_public_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_mx_record.mx_record_public_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record) | resource |
| [azurerm_dns_mx_record.mx_record_public_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record) | resource |
| [azurerm_dns_srv_record.srv_record_public_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record) | resource |
| [azurerm_dns_srv_record.srv_record_public_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record) | resource |
| [azurerm_dns_zone.zone_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_private_dns_a_record.a_record_private_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_a_record.a_record_private_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_aaaa_record.aaaa_record_private_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_aaaa_record) | resource |
| [azurerm_private_dns_aaaa_record.aaaa_record_private_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_aaaa_record) | resource |
| [azurerm_private_dns_mx_record.mx_record_private_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |
| [azurerm_private_dns_mx_record.mx_record_private_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |
| [azurerm_private_dns_srv_record.srv_record_private_no_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_srv_record) | resource |
| [azurerm_private_dns_srv_record.srv_record_private_with_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_srv_record) | resource |
| [azurerm_private_dns_zone.zone_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | (Optional) Specifies a list of A records to create in the specified DNS zone. | `list(any)` | `[]` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | (Optional) Specifies a list of AAAA records to create in the specified DNS zone. | `list(any)` | `[]` | no |
| <a name="input_create_dns_zone"></a> [create\_dns\_zone](#input\_create\_dns\_zone) | (Optional) Whether or not create the DNS zone. | `bool` | `true` | no |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | (Optional) Specifies a map of MX records to create in the specified DNS zone. | `any` | `{}` | no |
| <a name="input_public_dns_zone"></a> [public\_dns\_zone](#input\_public\_dns\_zone) | (Optional) Whether or not the created DNS zone is public. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | (Optional) Specifies a map of SRV records to create in the specified DNS zone. | `any` | `{}` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | (Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_zone_tags"></a> [zone\_tags](#input\_zone\_tags) | (Optional) A mapping of tags to assign to the created DNS zone. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_record_fqdn"></a> [a\_record\_fqdn](#output\_a\_record\_fqdn) | A list of DNS A Record FQDN. |
| <a name="output_a_record_id"></a> [a\_record\_id](#output\_a\_record\_id) | A list of DNS A Record ID. |
| <a name="output_aaaa_record_fqdn"></a> [aaaa\_record\_fqdn](#output\_aaaa\_record\_fqdn) | A list of DNS AAAA Record FQDN. |
| <a name="output_aaaa_record_id"></a> [aaaa\_record\_id](#output\_aaaa\_record\_id) | A list of DNS AAAA Record ID. |
| <a name="output_mx_record_fqdn"></a> [mx\_record\_fqdn](#output\_mx\_record\_fqdn) | A list of DNS MX Record FQDN. |
| <a name="output_mx_record_id"></a> [mx\_record\_id](#output\_mx\_record\_id) | A list of DNS MX Record ID. |
| <a name="output_srv_record_id"></a> [srv\_record\_id](#output\_srv\_record\_id) | A list of DNS SRV Record ID. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The DNS Zone ID. |
| <a name="output_zone_max_number_of_record_sets"></a> [zone\_max\_number\_of\_record\_sets](#output\_zone\_max\_number\_of\_record\_sets) | Maximum number of Records in the zone. |
| <a name="output_zone_number_of_record_sets"></a> [zone\_number\_of\_record\_sets](#output\_zone\_number\_of\_record\_sets) | The number of records already in the zone. |

## Contribute

You can contribute by adding support for :

- any DNS records that is not yet implemented.
- `soa_record` block in public and private DNS zone.
- any other ideas are welcome ;)
<!-- END_TF_DOCS -->