---
title: Name Servers
---

# Name Server API

* TOC
{:toc}


## List domain name servers {#list}

List the delegated name servers for a domain.

    GET /domains/:domain/name_servers

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

List delegated name servers for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          https://api.dnsimple.com/v1/domains/example.com/name_servers

### Response

Responds with HTTP 200 on success, returns the array of assigned name servers.

~~~js
[
  "ns1.example.com",
  "ns2.example.com",
  "ns3.example.com",
  "ns4.example.com"
]
~~~


## Change domain name servers {#change}

Change the delegated name servers for a domain, either to external name servers or back to DNSimple's name servers.

    POST /domains/:domain/name_servers

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

### Example

Change delegated name servers for domain `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/name_servers

### Input

This API accepts up to 6 name servers.

~~~js
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

~~~js
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

Responds with HTTP 200 on success, returns the array of assigned name servers.

~~~js
[
  "ns1.example.com",
  "ns2.example.com",
  "ns3.example.com",
  "ns4.example.com"
]
~~~

Responds with HTTP 400 if bad request.


## Register a domain name server at the registry

    POST /domains/:domain/registry_name_servers

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id

The domain must be registered with DNSimple in order for this command to work.

### Example

Register a name server belonging to `example.com`:

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v1/domains/example.com/registry_name_servers

### Input

~~~js
{
  "name_server": {
    "name": "ns1.example.com",
    "ip": "1.2.3.4"
  }
}
~~~

### Response

Responds with HTTP 200 on success, returns the name server.

~~~js
{
  "name": "ns1.example.com",
  "ip": 12
}
~~~

Responds with HTTP 400 if bad request.


## De-register a domain name server at the registry

De-register the name server `ns1.example.com` belonging to `example.com`:

    DELETE /domains/:domain/registry_name_servers/:name

### Parameters

Name | Type | Description
-----|------|------------
`:domain` | `string`, `integer` | The domain name or id
`:name` | `string` | The name server name

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X DELETE \
          https://api.dnsimple.com/v1/domains/example.com/registry_name_servers/ns1.example.com

### Response

Responds with HTTP 204 on success.

Responds with HTTP 400 if bad request.
