#!/bin/bash

body=${4:-"{}"}

curl -s \
  -i \
  --http1.1 \
  -H "Authorization: Bearer $1" \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -X $2 \
  $3 -d $body |
  sed 's/^Transfer-Encoding: chunked/Transfer-Encoding: identity/'
