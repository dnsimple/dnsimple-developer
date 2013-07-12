---
title: WHOIS Privacy Protection
---

# WHOIS Privacy Protection API

WHOIS Privacy Protection replaces a domain's WHOIS data with a proxy service to protect a customer's address, phone number and email address. The service is a paid service and must be renewed on a yearly basis.

* TOC
{:toc}


## Enable WHOIS Privacy

    POST /domains/:domain/whois_privacy

If WHOIS Privacy Protection has not yet been purchased then invoking this will purchase the service and enable it.
If the privacy protection is currently disabled then it will be enabled.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          https://dnsimple.com/domains/:domain/whois_privacy

### Response

~~~ js
{
  "whois_privacy": {
    "id": 18,
    "domain_id": 1000,
    "auto_renew": false,
    "expires_on": "2012-07-23",
    "enabled": false,
  }
}
~~~


## Disable WHOIS Privacy

<div class="alert">
  <strong>Warning!</strong> There are <a href="/planned-changes/#delete-domainsdomainwhois_privacy">planned changes</a> for this API method.
</div>

    DELETE /domains/:domain/whois_privacy

If the privacy protection has not expired it can always be turned back on with no additional charge.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/whois_privacy

### Response

~~~ js
{
  "whois_privacy": {
    "id": 18,
    "domain_id": 1000,
    "auto_renew": false,
    "expires_on": "2012-07-23",
    "enabled": false,
  }
}
~~~

