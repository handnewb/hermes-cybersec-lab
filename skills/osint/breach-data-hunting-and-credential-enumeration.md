---
name: breach-data-hunting-and-credential-enumeration
description: This skill helps identify compromised credentials and breach data from publicly available sources using Open-Source Intelligence (OSINT) techniques, ideal for security professionals looking to supplement their threat intelligence efforts.
category: security
subcategory: osint
tools_needed: Nmap, Maltego, Whois

## Purpose
The purpose of this skill is to enable security professionals to hunt for breach data and enumerate compromised credentials from publicly available sources using OSINT techniques. This skill helps identify potential vulnerabilities and threats that may not be immediately apparent through other means.

## Prerequisites
- Familiarity with command-line tools such as Nmap
- Basic understanding of Open-Source Intelligence (OSINT) concepts

## Procedure

### Step 1: Network Reconnaissance using Nmap
```bash
nmap -sS --script-vuln [target-domain/IP] > vulns.txt
```
This step uses Nmap to perform a port scan of the target domain or IP, identifying potential vulnerabilities and reporting them to a text file.

### Step 2: Credential Enumeration using Maltego
```bash
maltego-console -f /path/to/vulns.txt -o csv > credentials.csv
```
This step uses Maltego's Console tool to parse the vulnerability data from the previous step and generate a CSV report of potential credentials, including email addresses and domain names.

### Step 3: Domain Registration and Whois Lookup
```bash
whois [domain-name] | grep registrar > domain_info.txt
```
This step uses Whois to look up information about the domain registration, including the registrar and contact details, which can help identify potential threats.

## Expected Results
A CSV report of potential credentials, a text file of vulnerability data, and a text file of domain registration information.

## Common Pitfalls
- Overreliance on publicly available data, which may not always be accurate or up-to-date.
- Failure to consider the context and relevance of the gathered data in relation to the specific security threat.