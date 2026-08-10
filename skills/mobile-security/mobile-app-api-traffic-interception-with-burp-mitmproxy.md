---
name: mobile-app-api-traffic-interception-with-burp-mitmproxy
description: This skill enables mobile app API traffic interception for security testing purposes, allowing you to identify potential vulnerabilities such as authentication bypass or sensitive data leakage. It is particularly useful when testing the security of mobile apps that use APIs for functionality.
category: security
subcategory: mobile-security
tools_needed: Burp Suite, Mitmproxy

# Mobile App Api Traffic Interception With Burp/Mitmproxy

## Purpose
This skill addresses the security problem of identifying potential vulnerabilities in mobile app APIs. By intercepting API traffic, you can test the app's security posture and identify weaknesses that an attacker could exploit.

## Prerequisites
- Familiarity with Burp Suite and Mitmproxy
- Understanding of HTTP requests and responses

## Procedure

### Step 1: Configure Burp Suite as a Proxy Server
```bash
# On Windows:
burpsuite.exe --proxy http://localhost:8080

# On Linux/Mac:
burp burp -i http://localhost:8080
```
Configure your mobile app's HTTP proxy to point to the Burp proxy server.

### Step 2: Start Mitmproxy and Forward Traffic to Burp
```bash
# On Windows:
mitmdump.exe --ssl -s 8080

# On Linux/Mac:
mitmdump --ssl -s 8080
```
This step sets up Mitmproxy as a proxy server that forwards traffic from the mobile app to Burp.

### Step 3: Inspect API Traffic in Burp Suite
1. Start the mobile app and send a request using Burp's "Intercept" feature.
2. Inspect the request and response bodies, headers, and query strings.
3. Use Burp's "Decoded" view to decode binary data.

## Expected Results
Success is indicated by successful interception of API traffic and ability to inspect requests and responses.

## Common Pitfalls
- Not properly configuring the proxy server or Mitmproxy
- Missing key certificates or authentication credentials

## References
- The official Burp Suite documentation: <https://portswigger.net/burp>
- The official Mitmproxy documentation: <https://mitmproxy.org/>