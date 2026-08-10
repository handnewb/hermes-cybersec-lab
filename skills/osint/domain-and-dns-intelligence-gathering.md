---
name: domain-and-dns-intelligence-gathering
description: This skill enables the gathering of domain and DNS intelligence to identify potential security threats, track malware, or uncover intellectual property violations using publicly available data sources. It is particularly useful when conducting open-source intelligence (OSINT) for threat hunting, incident response, or compliance monitoring.
category: security
subcategory: osint
tools_needed: dnsmap, dig, nslookup

# Domain And Dns Intelligence Gathering

## Purpose
Domain and DNS intelligence gathering is crucial in identifying potential security threats, tracking malware, and uncovering intellectual property violations. This skill helps threat hunters, incident responders, and compliance officers to gather relevant information from publicly available data sources.

## Prerequisites
- Basic understanding of DNS protocol
- Familiarity with command-line interfaces

## Procedure

### Step 1: DNSenum
```bash
dnsmap -d example.com
```
This step enumerates all the domains associated with a given domain (example.com) and reveals potential subdomains, IP addresses, and mail servers.

### Step 2: DNS digging
```bash
dig +short mx example.com
```

This step retrieves the mail exchange (MX) records for a given domain (example.com), providing information on potential email providers and their associated IP addresses.

## Expected Results
The successful execution of this skill should reveal potential security threats, track malware, or uncover intellectual property violations. The gathered intelligence can be used to update threat intelligence feeds, inform incident response efforts, or enhance compliance monitoring.

## Common Pitfalls
- Misinterpretation of DNS records as legitimate domain names
- Failure to account for temporary DNS changes

## References
- https://www.dnsmap.info/
- https://en.wikipedia.org/wiki/Domain_Name_System