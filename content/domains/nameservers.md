---
title: Name Servers
---

# Name Server API

* TOC
{:toc}


## Change domain name servers

Change the name servers either to external name servers or back to DNSimple's name servers.

    POST /domains/:domain/name_servers

### Parameters

:domain
: The _string_ domain name or _integer_ domain id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/:domain/name_servers

### Input

This API accepts up to 6 name servers.

~~~ js
{
  "name_servers": {
    "ns1": "ns1.example.com",
    "ns2": "ns2.example.com",
    "ns3": "ns3.example.com",
    "ns4": "ns4.example.com"
  }
}
~~~

To change the name servers back to DNSimple's name servers, send the following body:

~~~ js
{
  "name_servers": {
    "ns1": "ns1.dnsimple.com",
    "ns2": "ns2.dnsimple.com",
    "ns3": "ns3.dnsimple.com",
    "ns4": "ns4.dnsimple.com"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## Register a domain name server at the registry

    POST /domains/:domain/registry_name_servers

### Parameters

:domain
: The _string_ domain name or _integer_ domain id

The domain must be registered with DNSimple in order for this command to work.

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://dnsimple.com/domains/:domain/registry_name_servers

### Input

This API accepts up to 6 name servers.

~~~ js
{
  "name_server": {
    "name": "ns1.example.com",
    "ip": "1.2.3.4"
  }
}
~~~

### Response

~~~ js
TODO
~~~


## De-register a domain name server at the registry

    DELETE /domains/:domain/registry_name_servers/:name

### Parameters

:domain
: The _string_ domain name or _integer_ domain id

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://dnsimple.com/domains/:domain/registry_name_servers/:name

### Response

~~~ js
TODO
~~~
