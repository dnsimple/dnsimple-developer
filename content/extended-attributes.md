---
title: Extended Attributes
---

# Extended Attribute API

Some TLDs require extended attributes when registering or transferring a domain.
This API interface provides information on the extended attributes for any particular TLD.

{:toc}


## List extended attributes for a TLD

    GET /extended_attributes/:tld

### Example

    curl  -H 'X-DNSimple-Token: <email>:<token>' \
          -H 'Accept: application/json' \
          https://dnsimple.com/extended_attributes/:tld

### Response

~~~ js
[
  {
    "name": "uk_legal_type",
    "description": "Legal type of registrant contact",
    "required": true,
    "options": [
      {
        "title": "UK Individual",
        "value": "IND",
        "description": "UK Individual (our default value)"
      },
      {
        "title": "Non-UK Individual (representing self)",
        "value": "FIND",
        "description": "Non-UK Individual (representing self)"
      },
      {
        "title": "UK Limited Company",
        "value": "LTD",
        "description": "UK Limited Company"
      },
      {
        "title": "UK Public Limited Company",
        "value": "PLC",
        "description": "UK Public Limited Company"
      },
      {
        "title": "UK Partnership",
        "value": "PTNR",
        "description": "UK Partnership"
      },
      {
        "title": "UK LLP",
        "value": "LLP",
        "description": "UK Limited Liability Partnership"
      },
      {
        "title": "UK Sole Trader",
        "value": "STRA",
        "description": "UK Sole Trader"
      },
      {
        "title": "UK Registered Charity",
        "value": "RCHAR",
        "description": "UK Registered Charity"
      },
      {
        "title": "UK Industrial/Provident Registered Company",
        "value": "IP",
        "description": "UK Industrial/Provident Registered Company"
      },
      {
        "title": "UK School",
        "value": "SCH",
        "description": "UK School"
      },
      {
        "title": "Other Foreign",
        "value": "FOTHER",
        "description": "Other foreign organizations"
      },
      {
        "title": "UK Government Body",
        "value": "GOV",
        "description": "UK Government Body"
      },
      {
        "title": "UK Corporation by Royal Charter",
        "value": "CRC",
        "description": "UK Corporation by Royal Charter"
      },
      {
        "title": "UK Statutory Body",
        "value": "STAT",
        "description": "UK Statutory Body"
      },
      {
        "title": "UK Entity (other)",
        "value": "OTHER",
        "description": "UK Entity (other)"
      },
      {
        "title": "Non-UK Corporation",
        "value": "FCORP",
        "description": "Non-UK Corporation"
      },
      {
        "title": "Non-UK Organization (other)",
        "value": "FOTHER",
        "description": "Non-UK Organization"
      }
    ]
  },
  {
    "name": "uk_reg_co_no",
    "description": "Company identification number",
    "required": false,
    "options": [

    ]
  },
  {
    "name": "registered_for",
    "description": "Company or person domain is registered for (this must be accurate and CANNOT BE CHANGED)",
    "required": true,
    "options": [

    ]
  },
  {
    "name": "uk_reg_opt_out",
    "description": "Hide registrant data in Nominet WHOIS",
    "required": false,
    "options": [
      {
        "title": "No",
        "value": "n",
        "description": "Do not hide the registrant contact information in Nominet&#39;s WHOIS."
      },
      {
        "title": "Yes",
        "value": "y",
        "description": "Hide the registrant contact information in Nominet&#39;s WHOIS (only available to individuals)."
      }
    ]
  }
]
~~~
