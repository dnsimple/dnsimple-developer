---
title: Name Servers | Domains | DNSimple API v2
excerpt: This page documents the DNSimple domain name servers API v2.
---

# Domain name servers API

* TOC
{:toc}

Retrieve and manage delegation for a domain in DNSimple.


## List name servers for a domain {#list}

    GET /:account/domains/:domain/name_servers

List name servers for the domain in the account.

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

List name servers for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/domains/example.com/name_servers

### Response

Responds with HTTP 200.

~~~json
[
  "ns1.example.com",
  "ns2.example.com"
]
~~~

## Update name servers for a domain {#update}

    PUT /:account/domains/:domain/name_servers

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:domain` | `string`, `integer` | The domain name or id

### Example

Update name servers for the domain example.com in the account 1010.

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          -H 'Content-Type: application/json' \
          -X POST \
          -d '<json>' \
          https://api.dnsimple.com/v2/1010/domains/example.com/name_servers

### Input

Name | Type | Description
-----|------|------------
`name_servers` | `list` | **Required** A list of name server names as strings.

##### Example

~~~json
"{
  "name_servers": [
    "ns1.example.com",
    "ns2.example.com"
  ]
}"
~~~

Alternatively, this is a shorter valid payload to use.

~~~json
"[
  "ns1.example.com",
  "ns2.example.com"
]"
~~~

### Response

Responds with HTTP 200 on success, renders the list of name server names.

~~~json
[
  "ns1.example.com",
  "ns2.example.com"
]
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the delegation fails.
