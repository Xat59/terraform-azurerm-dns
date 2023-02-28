resource "azurerm_private_dns_srv_record" "srv_record_private_with_zone" {
  count               = var.srv_records == {} ? 0 : (var.create_dns_zone ? (var.public_dns_zone ? 0 : 1) : 0)

  zone_name           = azurerm_private_dns_zone.zone_private.0.name
  resource_group_name = var.resource_group_name

  name                = var.srv_records.name
  ttl                 = lookup(var.srv_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.srv_records, "records", {})

    content {
      priority  = record.value.priority
      weight    = record.value.weight
      port      = record.value.port
      target    = record.value.target
    }
  }

  depends_on = [ azurerm_private_dns_zone.zone_private ]
}

resource "azurerm_dns_srv_record" "srv_record_public_with_zone" {
  count               = var.srv_records == {} ? 0 : (var.create_dns_zone ? (var.public_dns_zone ? 1 : 0) : 0)

  zone_name           = azurerm_dns_zone.zone_public.0.name
  resource_group_name = var.resource_group_name

  name                = var.srv_records.name
  ttl                 = lookup(var.srv_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.srv_records, "records", {})

    content {
      priority  = record.value.priority
      weight    = record.value.weight
      port      = record.value.port
      target    = record.value.target
    }
  }

  depends_on = [ azurerm_dns_zone.zone_public ]
}

resource "azurerm_private_dns_srv_record" "srv_record_private_no_zone" {
  count               = var.srv_records == {} ? 0 : (var.create_dns_zone ? 0 : (var.public_dns_zone ? 0 : 1))

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.srv_records.name
  ttl                 = lookup(var.srv_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.srv_records, "records", {})

    content {
      priority  = record.value.priority
      weight    = record.value.weight
      port      = record.value.port
      target    = record.value.target
    }
  }
}

resource "azurerm_dns_srv_record" "srv_record_public_no_zone" {
  count               = var.srv_records == {} ? 0 : (var.create_dns_zone ? 0 : (var.public_dns_zone ? 1 : 0))

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.srv_records.name
  ttl                 = lookup(var.srv_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.srv_records, "records", {})

    content {
      priority  = record.value.priority
      weight    = record.value.weight
      port      = record.value.port
      target    = record.value.target
    }
  }
}
