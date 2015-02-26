---
title: Dynamic DNS Shell Script
---

# Dynamic DNS Shell Script

Use this shell script to dynamically update a record on a regular schedule.

~~~bash
#!/bin/bash
 
LOGIN="your@email"
TOKEN="your-api-token"
DOMAIN_ID="yourdomain.com"
RECORD_ID="12345" # Replace with the Record ID
IP="`curl http://jsonip.com | sed 's/{"ip":"\(.*\)"/\1/g' | sed 's/}//'`"
 
curl -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -H "X-DNSimple-Token: $LOGIN:$TOKEN" \
     -X "PUT" \
     -i "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records/$RECORD_ID" \
     -d "{\"record\":{\"content\":\"$IP\"}}"
~~~

Download the shell script: [ddns.sh](ddns.sh)
