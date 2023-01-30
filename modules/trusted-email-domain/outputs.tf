output "dns_verification_entries" {
  value = concat(
    // SPF
    [{
      name   = data.pingone_trusted_email_domain_spf.this.key
      type   = data.pingone_trusted_email_domain_spf.this.type
      value  = data.pingone_trusted_email_domain_spf.this.value
      domain = pingone_trusted_email_domain.this.domain_name
    }],
    // Ownership
    flatten([
      for region in data.pingone_trusted_email_domain_ownership.this.region : [
        {
          name   = region.key
          type   = data.pingone_trusted_email_domain_ownership.this.type
          value  = region.value
          domain = pingone_trusted_email_domain.this.domain_name
        }
      ]
    ]),
    // DKIM
    flatten([
      for region in data.pingone_trusted_email_domain_dkim.this.region : [
        for token in region.token : [
          {
            name   = token.key
            type   = data.pingone_trusted_email_domain_dkim.this.type
            value  = token.value
            domain = pingone_trusted_email_domain.this.domain_name
          }
        ]
      ]
    ]),
  )
}
