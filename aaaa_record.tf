resource "azurerm_private_dns_aaaa_record" "aaaa_record_private_with_zone" {
  count = var.create_dns_zone ? (var.public_dns_zone ? 0 : length(var.aaaa_records)) : 0

  zone_name           = azurerm_private_dns_zone.zone_private.0.name
  resource_group_name = var.resource_group_name

  name    = var.aaaa_records[count.index].name
  records = var.aaaa_records[count.index].records
  ttl     = var.aaaa_records[count.index].ttl

  depends_on = [azurerm_private_dns_zone.zone_private]
}

resource "azurerm_dns_aaaa_record" "aaaa_record_public_with_zone" {
  count = var.create_dns_zone ? (var.public_dns_zone ? length(var.aaaa_records) : 0) : 0

  zone_name           = azurerm_dns_zone.zone_public.0.name
  resource_group_name = var.resource_group_name

  name    = var.aaaa_records[count.index].name
  records = var.aaaa_records[count.index].records
  ttl     = var.aaaa_records[count.index].ttl

  depends_on = [azurerm_dns_zone.zone_public]
}

resource "azurerm_private_dns_aaaa_record" "aaaa_record_private_no_zone" {
  count = var.create_dns_zone ? 0 : (var.public_dns_zone ? 0 : length(var.aaaa_records))

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name    = var.aaaa_records[count.index].name
  records = var.aaaa_records[count.index].records
  ttl     = var.aaaa_records[count.index].ttl
}

resource "azurerm_dns_aaaa_record" "aaaa_record_public_no_zone" {
  count = var.create_dns_zone ? 0 : (var.public_dns_zone ? length(var.aaaa_records) : 0)

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name    = var.aaaa_records[count.index].name
  records = var.aaaa_records[count.index].records
  ttl     = var.aaaa_records[count.index].ttl
}
