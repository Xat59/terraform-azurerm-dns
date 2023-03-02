module "dns" {
  source = "github.com/Xat59/terraform-azurerm-dns"

  # DNS zone name and its resource group.
  zone_name           = "az.domain.net"
  resource_group_name = "rg-monitoring01"

  # Create a private DNS.
  create_dns_zone = true
  public_dns_zone = false

  # Create A records.
  a_records = [
    {
      name    = "www"
      records = ["10.10.10.1"]
      ttl     = 3600
    },
    {
      name    = "myshop"
      records = ["10.10.10.2"]
      ttl     = 3600
    }
  ]

  # Create SOA record.
  soa_record = {
    email     = "admin"
    host_name = "ns1-03.azure-dns.com."

    tags = {
      "env"   = "prod"
      "owner" = "Xat59"
    }
  }

  # Create MX records.
  mx_records = {
    name = "mail"
    ttl  = 3600
    records = [
      {
        preference = 10,
        exchange   = "mail1.contoso.com"
      },
      {
        preference = 20,
        exchange   = "mail2.contoso.com"
      }
    ]
  }

  # Create SRV records.
  srv_records = {
    name = "testsrv"
    ttl  = 3600
    records = [
      {
        priority = 10
        weight   = 80
        port     = 8080
        target   = "srv.test.bla"
      },
      {
        priority = 20
        weight   = 100
        port     = 8080
        target   = "srv2.test.bla"
      }
    ]
  }
}