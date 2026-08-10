---
name: webhook-security-testing-and-ssrf-via-callbacks
description: This skill teaches how to test webhooks for security vulnerabilities, specifically Server-Side Request Forgery (SSRF) via callbacks, and when to use it in a penetration testing or vulnerability assessment engagement.
category: security
subcategory: api-security
tools_needed: Burp Suite, Nmap

# Webhook Security Testing And Ssrf Via Callbacks

## Purpose
Webhooks are commonly used to extend the functionality of APIs, but they can also introduce security risks if not properly configured. This skill teaches how to identify and exploit Server-Side Request Forgery (SSRF) vulnerabilities in webhooks via callbacks.

## Prerequisites
- Familiarity with Burp Suite and Nmap
- Knowledge of HTTP requests and responses

## Procedure

### Step 1: Inspect Webhook Callbacks
Use Burp Suite's "Target" tab to inspect the webhook callback endpoint. Look for any suspicious or unvalidated input parameters.

```bash
burp-suite -target <callback_url>
```

This will allow you to analyze the request and response headers, as well as any sensitive data being transmitted.

### Step 2: Attempt SSRF via Callbacks
Use Nmap's "--script" option to run a script that attempts to perform an SSRF attack on the webhook callback endpoint. This can be done by specifying a script like `http-script/ssl-enum-certs` and piping it into Nmap.

```bash
nmap -sV --script http-script/ssl-enum-certs <callback_url> | grep CERT
```

This will attempt to enumerate SSL certificates on the target server, potentially revealing internal IP addresses or domains that can be used for SSRF.

## Expected Results
A successful SSRF attack should reveal a list of internal IP addresses or domains. If the webhook callback is vulnerable, you may also see sensitive data being transmitted or requests being made to unknown servers.

## Common Pitfalls
- Not properly validating input parameters in webhooks
- Using unsecured communication protocols (e.g., HTTP instead of HTTPS)
- Failing to rotate SSL certificates

## References
- OWASP: Webhook Security Best Practices
- Burp Suite: API Security Testing Guide