---
title: Zone Records API | DNSimple API v2
excerpt: This page documents the DNSimple zone records API v2.
---

# Zone Record API

* TOC
{:toc}


## Zone record attributes {#zone-record-attributes}

Please refer to the definition of the `ZoneRecord` data type in [our OpenAPI documentation](/v2/openapi.yml).


## Record Regions {#ZoneRecordRegions}

<info>
The zone record **regions** is a feature that is only available to the following [new plans](https://support.dnsimple.com/articles/new-plans/#newer-plans-some): Professional and Business.
If the feature is not enabled, you will receive an HTTP 412 response code.
</info>

Zone Record Regions lets you select geographical regions where you want a record to appear.

We currently have 8 points of presence:

Code  | Region
------|-------
`SV1` | California, US
`ORD` | Illinois, US
`IAD` | Virginia, US
`AMS` | Amsterdam, NL
`TKO` | Tokyo, JP
`SYD` | Sydney, AU
`CDG` | Paris, FR
`FRA` | Frankfurt, DE

When creating/updating a record, you can **optionally** select one or more regions.
**If you don't select any, the record will appear in all of them (`global`).**


## List zone records {#listZoneRecords}

~~~
GET /:account/zones/:zone/records
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name

### Filters

Name | Description
-----|------------
`:name_like` | Only include records containing given string
`:name` | Only include records with name equal to given string
`:type` | Only include records with record type equal to given string

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`id` | Sort records by ID
`name` | Sort records by name (alphabetical order)
`content` | Sort records by content
`type` | Sort records by type

The default sorting policy is by ascending `id`.

### Examples

List records for the zone `example.com` in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records
~~~

List records for the zone `example.com` with TXT zone records, in the account `1010`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1010/zones/example.com/records?type=TXT
~~~

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listZoneRecords/success.http") %>
~~~


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
`name` | `string` | **Required**. The record name, without the domain. The domain will be automatically appended. Use an empty string to create a record for the apex.
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
<%= pretty_print_fixture("/api/createZoneRecord/created.http") %>
~~~

Responds with HTTP 400 if bad request.

Responds with HTTP 400 if the validation fails.


## Retrieve a zone record {#getZoneRecord}

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
<%= pretty_print_fixture("/api/getZoneRecord/success.http") %>
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

The following fields are updateable. You can pass zero or any of them.

Name | Type | Description
-----|------|------------
`name` | `string` |  The record name, without the domain. The domain will be automatically appended. Use an empty string to create a record for the apex.
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
<%= pretty_print_fixture("/api/updateZoneRecord/success.http") %>
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


## Check zone record distribution {#checkZoneRecordDistribution}

Checks if a zone change is fully distributed to all our nameservers across the globe.

~~~
GET /:account/zones/:zone/records/:record/distribution
~~~

<note>
This feature is not available for testing in our <a href="/sandbox">Sandbox</a> environment.
</note>

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account id
`:zone` | `string` | The zone name
`:record` | `integer` | The record id

### Example

Check the zone record distribution for `example.com` in the account `1010`:

    curl  -H 'Authorization: Bearer <token>' \
          -H 'Accept: application/json' \
          https://api.dnsimple.com/v2/1010/zones/example.com/records/5/distribution

### Response

Responds with HTTP 200 when the zone record is fully distributed.

~~~json
<%= pretty_print_fixture("/api/checkZoneRecordDistribution/success.http") %>
~~~

Responds with HTTP 200 when the zone record is not distributed.

~~~json
<%= pretty_print_fixture("/api/checkZoneRecordDistribution/failure.http") %>
~~~

Responds with HTTP 504 when the server failed to perform the check.

~~~json
<%= pretty_print_fixture("/api/checkZoneRecordDistribution/error.http") %>
~~~
