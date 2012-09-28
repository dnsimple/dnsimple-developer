---
title: SSL Certificates
---

# SSL Certificate API

Purchase and manage SSL certificates.


# List certificates for a domain

    GET /domains/:domain/certificates

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/certificates

### Response

<pre class="highlight"><code class="language-js">
TODO
</code></pre>


# Get a certificate

    GET /domains/:domain/certificates/:id

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          https://dnsimple.com/domains/:domain/certificates/:id

### Response

<pre class="highlight"><code class="language-js">
{
  "certificate": {
    "approver_email": null,
    "certificate_status": null,
    "configured_at": "2011-05-14T15:14:43Z",
    "contact_id": 470,
    "created_at": "2011-05-14T15:14:43Z",
    "csr": "-----BEGIN NEW CERTIFICATE REQUEST-----
    MIIC0DCCAbgCAQAwWzELMAkGA1UEBhMCVVMxFTATBgNVBAoTDEFudGhvbnkgRWRl
    bjEOMAwGA1UEBxMFTWlhbWkxCzAJBgNVBAgTAkZMMRgwFgYDVQQDEw93d3cuZXhh
    bXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtW/z7avuO
    CrvfRBYkqJt+2w8YlivjMrUTOJT2DQdqXTnOgqnOeL4+Jdey9BBaJRQS+HhPLkJN
    rBmv9uDOEzQBAfm3POP/2Cg6ZvDren+fZuziq+FRopxDiaDupnWgVxCAzxu9wzOb
    dXQW5dB0BnrtPsclYhPwgSMIhxaCbeJSIDP1WveCZzRyLIthg6ajOMsKILKJ+TQg
    K64dpV4LGU5uLUrYHCMMatQ5OZ+N1PKL3nPLSKEHtLnYxKDoX3em5tRz7pc4JsIC
    UFOIRIuQr7Gdp9sH9fHVwcvZL5q1Ykz83rWKHAhu2vBL04n3EYFLYlA9NzPO23Zj
    GkWYafsn1gu9AgMBAAGgMDAuBgkqhkiG9w0BCQ4xITAfMAwGA1UdEwEB/wQCMAAw
    DwYDVR0PAQH/BAUDAweAADANBgkqhkiG9w0BAQUFAAOCAQEAgl4cBmVFpbl1Y1iD
    H6xPeRaT60jp2pPi3pwE7jTw6oqTSqCuH9EAvG2FopUlV7Jz10I8w7Cts2fwgayr
    h6MnSTUv1Nep6pEKrQaOYbAmwioTEZaNyzRwQVy6geKcz0PZeVFHm7Hs57WTJQiR
    bpm0sc/Rhu9h19y14KRlfWUwQU8rM8biJSGJhIpJ9TqtxMcKgswYKV8L6pt4ZvKM
    /IuGxTqSv4pJagzSCbww+8uyKfscOMnEUkkFOE2/kK+Bf+EdAy2rKLJDqPRc1Yeb
    WUf0sRMLu6e50I140w2YYIyyKR10KHP6PQmr+Fz9DxEmjgAY7BWOLS3TSwqCm0Ek
    t0evlw==
    -----END NEW CERTIFICATE REQUEST-----",
    "domain_id": 1497,
    "expiration_date": null,
    "id": 1,
    "name": "www",
    "order_date": null,
    "private_key": "-----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEArVv8+2r7jgq730QWJKibftsPGJYr4zK1EziU9g0Hal05zoKp
    zni+PiXXsvQQWiUUEvh4Ty5CTawZr/bgzhM0AQH5tzzj/9goOmbw63p/n2bs4qvh
    UaKcQ4mg7qZ1oFcQgM8bvcMzm3V0FuXQdAZ67T7HJWIT8IEjCIcWgm3iUiAz9Vr3
    gmc0ciyLYYOmozjLCiCyifk0ICuuHaVeCxlObi1K2BwjDGrUOTmfjdTyi95zy0ih
    B7S52MSg6F93pubUc+6XOCbCAlBTiESLkK+xnafbB/Xx1cHL2S+atWJM/N61ihwI
    btrwS9OJ9xGBS2JQPTczztt2YxpFmGn7J9YLvQIDAQABAoIBAADxEvq6pgsre8HG
    uOgSEmYqAnb7udlOGTW1hPmhMH0fbIT2qL16Ym4r/nP2Z3BV6zn/J4gmlC2f1bPi
    /22fJRUsUZLxPbvSDMXkcUKWM8NF59uDW4H6BCdJxBoHxXPNhUVt2pS5Trp1dN/6
    95rpvhkz0hkd40XXLb2KHlEvD5+qktOU7xg7R7aRATg6KtEpSxDqKwNy5o3+YVAe
    Z+nhYCevKboshMuJFx7OJ0zvn3gYU7/85RI9Zn4ofqUjFzZl6PPHmb6xn5v1v6+5
    t9gp19FF1MbMFpnKnsbR/2jm5xX3BVo5PofM2Xx04hThCi9pno/JApdJ95nOzmuK
    bQT9YIECgYEAzW2KugAoN0JwhlGc9pIcZ1OyM9YYAN4KHCVlaFIIfWD1PoP1uieV
    EIsGb9bworQgItXi6SwFnw+i9eRZI70Hmx+Y8SSY9IDtiI1nY5W71H9+9CJS/foc
    zDbmYclR/1e91MVwAVJDScECCuic9NUfxjaZDKChRPifKCXBG0wRGjUCgYEA2Als
    hJSsVQby00b+YuMCVp6IbyhvlGm6hKrKAQXNMhZWrHIs52qrlbuqeyfYg9IjGhSS
    +qNBRj/KzFvx8QuU55M3ydHZzz5Ah8MzwfP8gbVsdkPvnDbPvHDUkAFpewsp/4OG
    F5559iRwv/JStGgEtwnNV91JX5mmGOI7KxCynGkCgYAdlwnEgQFJ9GgA8QCLA8DT
    oVqp3MzYUyNhqoFQ5YATj0PEHX3nsovmNiBXO76tsQRwAB8PNygYIUh34sx0OWY/
    Ee4Vzg+6KFgOs0+RKKBFm5fN0qPhsYU0ZTQKIdWN0jWl0Eqx5geLOCHzME5rdcd9
    5Z9mEj0okidawRVvuSU9gQKBgDh7DkIDVKLONEIEd5GG5B+dRvI40iMtGTSCKlnm
    GGWV7YccOp0uCDoXXFTib/rWv5Kb+mlIsVIab3zKNRDeBEoe9SDwmk9SaTCVWjzE
    +yk2M2sgC879jYYowYn8tIUUwCArVK1sI1q04D1uryy3XTQ1fdgQ5JP36bLrwqhZ
    rzixAoGAbcOK7v+IUHamcWJb8kkAsrIxjAGE/CNLYiZTeSTbTegZFb9KcpNzojJT
    ClvuFGYh3Rb35NMC9XIvJbAfWBv1XB+TX+o41YcS8H3AocQtuxmxNqYzZOvUpAkM
    oWo54arDcDjcPm2TYZ0umKl/CacGYTwfUpA42BEpoxx+RcF7/XU=
    -----END RSA PRIVATE KEY-----",
    "ssl_certificate": null,
    "updated_at": "2011-05-14T15:14:43Z",
    "available_approver_emails": "res-dom@iana.org,res-dom@iana.org,admin@example.com,
    administrator@example.com,hostmaster@example.com,root@example.com,webmaster@example.com,
    postmaster@example.com,admin@www.example.com,administrator@www.example.com,
    hostmaster@www.example.com,root@www.example.com,webmaster@www.example.com,
    postmaster@www.example.com"
  }
}
</code></pre>


# Purchase a certificate

    POST /domains/:domain/certificates

This is the first step in the process for buying a certificate. Once you have successfully purchased a certificate you will need to submit it to complete the process and receive your SSL certificate.

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -d <json> \
          https://dnsimple.com/domains/:domain/certificates

### Input

The following fields are required:

- `certificate[name]`
- `certificate[contact_id]`

The following fields are optional:

- `certificate[csr]`

The `name` is the subdomain for the certificate. For example, if you have the domain mydomain.com and you want to register a certificate for www.mydomain.com then the name would be www. If you would like a certificate for the domain itself, such as mydomain.com, then leave name blank.

The `contact_id` is the ID of the contact that is responsible for the certificate. In case of wildcard domains, the contact information must match what is in the Certificate Signing Request. If you plan on submitting your own Certificate Signing Request then you must ensure these details match.

The optional `csr` field stands for Certificate Signing Request. If you do not want DNSimple to generate your private key then you generate your own Certificate Signing Request using a tool such as OpenSSL or GnuTLS. You must ensure that the common name in the CSR is your fully qualified domain name (for example, www.mydomain.com or *.mydomain.com).

<pre class="highlight"><code class="language-js">
{
  "certificate": {
    "name": "",
    "contact_id": 1
  }
}
</code></pre>

### Response

<pre class="highlight"><code class="language-js">
TODO
</code></pre>


# Submit a certificate for signing

Submit a previously purchased certificate for signing by the certificate authority.

    PUT /domains/:domain/certificates/:id/submit

### Example

    curl  -H "X-DNSimple-Token: <token>" \
          -H 'Accept: application/json' \
          -H "Content-Type: application/json" \
          -X PUT \
          https://dnsimple.com/domains/:domain/certificates/:id

### Response

<pre class="highlight"><code class="language-js">
TODO
</code></pre>


