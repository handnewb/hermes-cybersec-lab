---
name: http-request-smuggling-via-cl.te-and-te.cl-techniques
description: This skill teaches how to identify and exploit HTTP request smuggling vulnerabilities using CL.TE and TE.CL techniques in web applications. It is useful for security researchers and penetration testers who want to understand the underlying mechanics of request smuggling attacks.
category: security
subcategory: web-app-security
tools_needed: Nginx, Burp Suite

# Http Request Smuggling Via Cl.Te And Te.Cl Techniques

## Purpose
Request smuggling vulnerabilities allow an attacker to inject malicious requests into a web application's request pipeline, potentially leading to code injection, data tampering, or eavesdropping. This skill addresses the security problem of identifying and exploiting these vulnerabilities in web applications.

## Prerequisites
- Basic knowledge of HTTP requests and responses
- Familiarity with Nginx configuration files

## Procedure

### Step 1: Identify Potential Request Smuggling Vulnerabilities
Use Burp Suite to inspect the request pipeline of a target web application. Look for any suspicious headers, such as `TE` or `CL`, that may indicate a potential smuggling vulnerability.

```bash
burp suite -i <target_url>
```

### Step 2: Configure Nginx to Receive Multiple Headers
Create an Nginx configuration file with multiple `TE` and `CL` headers to simulate the request pipeline. This will help you understand how the web application processes these headers.

```nginx
http {
    server {
        listen 80;
        location / {
            proxy_pass http://localhost:8080;
            proxy_set_header Content-Type $Content-Type;
            proxy_set_header X-Original-URI $Request_URI;
            proxy_set_header TE "TE: chunked, close";
            proxy_set_header CL "CL: true";
        }
    }
}
```

### Step 3: Test for Request Smuggling Vulnerabilities
Use Burp Suite to send requests with manipulated `TE` and `CL` headers to the target web application. Verify that the request is processed correctly by checking the response headers.

```bash
burp suite -t <target_url> --data "http://example.com"
```

## Expected Results
The web application should process the request correctly, and the response headers should indicate that the request was successful.

## Common Pitfalls
- Forgetting to check for `TE` and `CL` headers in the target web application's configuration file
- Misconfiguring Nginx or Burp Suite to simulate the request pipeline

## References
- OWASP Request Smuggling Cheat Sheet
- Nginx Configuration Reference