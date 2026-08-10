```markdown
---
name: server-side-request-forgery-(ssrf)-to-internal-network-pivoting
description: This skill helps identify and exploit server-side request forgery (SSRF) vulnerabilities in web applications to pivot to an internal network for unauthorized access or data exfiltration. It is particularly useful for security researchers, penetration testers, and incident responders who need to assess the external exposure of an organization's internal network.
category: security
subcategory: web-app-security
tools_needed: Nmap, Burp Suite, Python, sqlmap

# Server-Side Request Forgery (Ssrf) To Internal Network Pivoting

## Purpose
Server-side request forgery (SSRF) vulnerabilities allow an attacker to redirect a legitimate request from the client to a target server on the internal network, potentially leading to unauthorized access or data exfiltration. This skill addresses the security problem by providing a method to exploit these vulnerabilities and pivot to the internal network.

## Prerequisites
- Basic knowledge of web application security and networking protocols (TCP/IP, HTTP)
- Experience with command-line tools such as Nmap and Python

## Procedure

### Step 1: Identify Potential SSRF Vulnerabilities Using Nmap

```bash
nmap -sV --step 2 --script http-title http://<target-domain>
```

This step uses the `http-title` script to identify HTTP servers that respond with a title tag, which may indicate an SSRF vulnerability.

### Step 2: Enumerate Open Ports and Services on the Target Server

```bash
nmap -sV --step 2 --open-port 80,443 http://<target-domain>
```

This step enumerates the open ports and services on the target server to identify potential SSRF vulnerabilities.

### Step 3: Execute a Request Redirect Using Burp Suite

```bash
burp_suite
- Open the "Target" tab and enter the URL of the target server.
- Click the "Redirect" button in the "HTTP" tab and select the port number of the target server.
- Send the request to the redirector and monitor for any responses from the internal network.
```

This step uses Burp Suite to execute a request redirect, sending traffic through the SSRF vulnerability to an internal network resource.

## Expected Results
A successful redirection should result in a response from an internal network resource, such as a web server or database. This indicates that the SSRF vulnerability has been exploited and the attacker can pivot to the internal network.

## Common Pitfalls
- Misidentifying legitimate traffic patterns.
- Overlooking network segmentation and access controls.
- Failing to consider the potential impact of internal resources on external exposure.

## References
- OWASP: Server-Side Request Forgery (SSRF) [https://owasp.org/www-pwvl/Attack_Techs/Server-Side_Request_Forgery](https://owasp.org/www-pwvl/Attack_Techs/Server-Side_Request_Forgery)
```