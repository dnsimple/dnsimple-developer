---
title: Zone Records API | DNSimple API v2
excerpt: This page documents the DNSimple zone records API v2.
---

# Zone Record API

* TOC
{:toc}

## Zone Record Regions

<note>
This Zone Record Regions is a feature that is only available to the following [new plans](https://support.dnsimple.com/articles/new-plans/#newer-plans-some): Professional and Business.
</note>

Zone Record Regions lets you select geographical regions where you want a record to appear.

We currently have 6 points of presence:

Code  | Region
------|-------
`SV1` | California, US
`ORD` | Illinois, US
`IAD` | Virginia, US
`AMS` | Amsterdam, NL
`TKO` | Tokyo, JP
`SYD` | Sydney, AU

When creating/updating a record, you can **optionally** select one or more regions.
**If you don't select any, the record will appear in all of them (`global`).**


## List records for a zone {#listZoneRecords}

~~~
GET /:account/zones/:zone/records
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

List records for the zone `example.com` in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records
~~~

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/listZoneRecords/success.http") %>
~~~

### Filters

Name | Description
-----|------------
`:name_like` | Only include records containing given string
`:name` | Only include records with name equal to given string
`:type` | Only include records with record type equal to given string

### Example

List records for the zone `example.com` with TXT zone records, in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records?type=TXT
~~~

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort records by ID
`name` | Sort records by name (alphabetical order)
`content` | Sort records by content
`type` | Sort records by type

The default sorting policy is by ascending `id`.


## Create a zone record {#createZoneRecord}

~~~
POST /:account/zones/:zone/records
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Example

Create a record for the zone `example.com` in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '<json>' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records
~~~

### Input

Name | Type | Description
-----|------|------------
`name` | `string` | **Required**. Use an empty string to create a record for the apex.
`type` | `string` | **Required**.
`content` | `string` | **Required**.
`ttl` | `integer` |
`priority` | `integer` |
`regions` | `array` | Optional set of [regions](#zone-record-regions)

##### Example

~~~json
{
  "name": "",
  "type": "MX",
  "content": "mxa.example.com",
  "ttl": 600,
  "priority": 10,
  "regions": ["SV1", "IAD"]
}
~~~

### Response

Responds with HTTP 201 on success.

~~~json
<%= pretty_print_fixture("/createZoneRecord/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Get a zone record {#getZoneRecord}

~~~
GET /:account/zones/:zone/records/:record
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Get the record `5` for the zone `example.com`, in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records/5
~~~

### Response

~~~json
<%= pretty_print_fixture("/getZoneRecord/success.http") %>
~~~


## Update a zone record {#updateZoneRecord}

~~~
PATCH /:account/zones/:zone/records/:record
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Update the record with ID `5` for zone `example.com`, in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X PATCH \
      -d '<json>' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records/5
~~~

### Input

The following fields are updateable. You can pass zero of any of them.

Name | Type | Description
-----|------|------------
`name` | `string` |
`content` | `string` |
`ttl` | `integer` |
`priority` | `integer` |
`regions` | `array` | Optional set of [regions](#zone-record-regions)

##### Example

~~~json
{
  "content": "mxb.example.com",
  "ttl": 3600,
  "priority": 20
  "regions": ["global"]
}
~~~

### Response

Responds with HTTP 200 on success.

~~~json
<%= pretty_print_fixture("/updateZoneRecord/success.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Delete a zone record {#deleteZoneRecord}

~~~
DELETE /:account/zones/:zone/records/:record
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Delete the record with ID `5` for zone `example.com`, in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      -X DELETE \
      https://api.dnsimple.com/v2/1010/zones/example.com/records/5
~~~

### Response

Responds with HTTP 204 on success.
