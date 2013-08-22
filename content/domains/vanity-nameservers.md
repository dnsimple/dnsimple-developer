---
title: Vanity Name Servers
---

# Vanity Name Server API

Vanity name servers are used to hide the use of DNSimple's name servers and instead use our name servers with different names.

Note: you must request activation of the vanity name servers feature on your account before you can manage vanity name servers through the API. Contact support@dnsimple.com for more details.

* TOC
{:toc}


## Enable vanity name servers for a domain

    POST /domains/:domain/vanity_name_servers

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/:domain/vanity_name_servers

### Input

Required fields:

- `vanity_nameserver_configuration[server_source]`

`server_source` must be either `dnsimple` or `external`.
If you pass `external` as the server source then you must include name servers to use.
You may use up to 4 external name servers (`ns1` through `ns4`).

Example with `dnsimple` source.

~~~ js
{
  "vanity_nameserver_configuration": {
    "server_source": "dnsimple"
  }
}
~~~

Example with `external` source.

~~~ js
{
  "vanity_nameserver_configuration": {
    "server_source": "external",
    "ns1": "ns1.example.com",
    "ns2": "ns2.example.com"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Disable vanity name servers for a domain

    DELETE /domains/:domain/vanity_name_servers

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/vanity_name_servers

### Response

~~~ js
{
  "status": "disabled"
}
~~~
