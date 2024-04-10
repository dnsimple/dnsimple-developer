---
title: Billing Charges API | DNSimple API v2
excerpt: This page documents the DNSimple billing charges API v2 endpoint.
---

# Billing Charges API

* TOC
{:toc}


## Charges attributes {#charges-attributes}

Please refer to the definition of the `Charge` data type in [our OpenAPI documentation](/v2/openapi.yml).


## List charges {#listCharges}

<%= render "v2-preview-endpoint" %>

Lists the billing charges for the account.

~~~
GET /:account/billing/charges
~~~

### Parameters

| Name       | Type      | Description    |
| ---------- | --------- | -------------- |
| `:account` | `integer` | The account ID |

### Filters

| Name          | Description                                                                 |
| ------------- | --------------------------------------------------------------------------- |
| `:start_date` | Only include results after the given date. Format is ISO8601 (YYYY-MM-DD).  |
| `:end_date`   | Only include results before the given date. Format is ISO8601 (YYYY-MM-DD). |

The default period is the last 1 year.

### Sorting

For general information about sorting, please refer to the [main guide](/v2/#sorting).

| Name       | Description                               |
| ---------- | ----------------------------------------- |
| `invoiced` | Sort charges by their invoiced date-time. |

The default sorting policy is by ascending `invoiced`.

### Examples

List all billing charges in the account `1385`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/1385/billing/charges
~~~

List all billing charges in the account `1385` that have been invoiced since `2023-01-01`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/1385/billing/charges?start_date=2023-01-01
~~~

List all billing charges in the account `1385` that have been invoiced between `2023-01-01` and `2023-02-01`:

~~~shell
curl  -H 'Authorization: Bearer <token>' \
        -H 'Accept: application/json' \
        https://api.dnsimple.com/v2/1385/billing/charges?start_date=2023-01-01&end_date=2023-02-01
~~~

### Response

Responds with HTTP 200.

~~~json
<%= pretty_print_fixture("/api/listCharges/success.http") %>
~~~

### Errors

Responds with [HTTP 400](/v2#bad-request) if the certificate cannot be ordered.

Responds with [HTTP 401](/v2#unauthorized) in case of authentication issues.
