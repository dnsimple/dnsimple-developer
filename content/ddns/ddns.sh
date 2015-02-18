#!/bin/bash

LOGIN="your@email"
ATOKEN="your-api-token"
DTOKEN="your-domain-token"

DOMAIN_ID="yourdomain.com"
RECORD_ID="12345" # Replace with the Record ID

# verify that your system has the programs "curl", "jq" and "sed" installed
IP="`curl http://jsonip.com | jq '.ip' | sed 's/"\(.*\)"/\1/g'`"
DATA='{"record":{"content":"'$IP'"}}'

curl    -H 'X-DNSimple-Token: '$LOGIN':'$ATOKEN \
        -H 'X-DNSimple-Domain-Token: '$DTOKEN \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json' \
        -X PUT \
        -d $DATA \
        https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records/$RECORD_ID