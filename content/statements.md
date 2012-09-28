---
title: Statements
---

# Statement API

API for listing account history as statements.

{:toc}


## List statements

    GET /statements

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/statements

### Response

~~~ js
[
  {
    "statement": {
      "basic_html_view": "...",
      "closed_at": "2012-09-09T15:45:10Z",
      "created_at": "2012-09-11T10:46:20Z",
      "html_view": "...",
      "id": 38265,
      "opened_at": "2012-08-09T15:43:32Z",
      "settled_at": "2012-09-09T15:45:10Z",
      "statement_identifier": "12382497",
      "subscription_id": 3817,
      "text_view": "...",
      "updated_at": "2012-09-11T10:46:20Z"
    }
  },
  {
    "statement": {
      "basic_html_view": "...",
      "closed_at": "2012-08-09T15:43:31Z",
      "created_at": "2012-08-11T10:18:51Z",
      "html_view": "...",
      "id": 34113,
      "opened_at": "2012-07-09T15:42:23Z",
      "settled_at": "2012-08-09T15:43:31Z",
      "statement_identifier": "11484661",
      "subscription_id": 3817,
      "text_view": "...",
      "updated_at": "2012-08-26T10:14:56Z"
    }
  }
]
~~~
