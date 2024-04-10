---
title: DNS Analytics API | DNSimple API v2
excerpt: This page documents the DNS Analytics API v2 endpoint.
---

# DNS Analytics API

* TOC
{:toc}


## Query DNS analytics data {#query}

<%= render "v2-preview-endpoint" %>

Queries and returns DNS Analytics data available for the provided query parameters:

~~~
GET /:account/dns_analytics
~~~

### Parameters

Name | Type | Description
-----|------|------------
`:account` | `integer` | The account ID

### Groupings

Name | Description
-----|------------
`:zone_name` | Group rows by zone name
`:date` | Group rows by date

No groupings will be applied by default unless specified.
Multiple groupings can be provided, separated by a comma.

<info>
Applying groupings to the query will add columns to the response payload.
</info>

### Filters

Name | Default value                   | Description
-----|---------------------------------|------------
`:start_date` | 31 days before the current date | Only include results starting from the provided date
`:end_date` | The day before the current date | Only include results up to the provided date

<info>
Both dates are **inclusive**, and must be provided in **ISO 8601 format** (e.g. `2024-08-01`).
</info>

<warning>
The maximum allowed date range is 31 days.
</warning>

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

Name | Description
-----|------------
`zone_name` | Sort rows by zone name
`date` | Sort rows by date
`volume` | Sort rows by query volume

The default sorting policy is by ascending `date`, then ascending `zone_name`.

### Pagination

Pagination is supported in this endpoint:

- The default page size (`per_page` query parameter) is 1,000.
- The maximum supported page size (`per_page` query parameter) is 10,000.
- Please refer to the [main guide](/v2/#pagination).

### Example: get total query volume data for the entire account

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1385/dns_analytics
~~~

### Example: get the top ten zones by volume in December, 2023

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1385/dns_analytics?groupings=zone_name&sort=volume:desc&per_page=10&start_date=2023-12-01&end_date=2023-12-31
~~~

### Example: get daily query volume for all zones in the account for the last 31 days, with custom sorting

~~~
curl  -H 'Authorization: Bearer <token>' \
      -H 'Accept: application/json' \
      https://api.dnsimple.com/v2/1385/dns_analytics?groupings=date,zone_name&sort=date:desc,zone_name:asc
~~~

### Response

Responds with HTTP 200.

##### Example

~~~json
<%= pretty_print_fixture("/api/dnsAnalytics/success.http") %>
~~~

### Errors

Responds with [HTTP 401](/v2#unauthorized) if there are authentication issues.
