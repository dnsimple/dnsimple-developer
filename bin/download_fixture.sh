#!/bin/bash

curl -s \
  -i \
  --http1.1 \
  -H "Authorization: Bearer $1" \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -X $2 \
  $3 |
  sed 's/^Transfer-Encoding: chunked/Transfer-Encoding: identity/'
