```markdown
---
name: whois-history-and-domain-registration-investigation
description: This skill is used to investigate WHOIS history and domain registration information in order to identify potential security threats or vulnerabilities, typically when conducting an OSINT (Open-Source Intelligence) gathering task. It's particularly useful for threat researchers and cybersecurity professionals looking to uncover information on malicious actors or their domains.
category: security
subcategory: osint
tools_needed: Whois Lookup Tools (e.g., whois.net), DNS Resolution Tools (e.g., dig), Command Line Interface (CLI)

## Purpose
The purpose of this skill is to gather and analyze WHOIS records to identify potential connections between a domain and its registered information, including administrators, contact details, and IP addresses. This can help cybersecurity professionals understand the ownership and control structure of a domain, which is crucial in identifying potential security threats or vulnerabilities.

## Prerequisites
- Basic understanding of command line interfaces (CLI) and DNS resolution tools.
- Familiarity with WHOIS lookup tools and their functionality.

## Procedure

### Step 1: Performing an Initial Whois Lookup
```bash
whois <domain-name>
```
This step involves using a WHOIS lookup tool to gather initial information about the domain, including its registrar, contact details, and administrative information. The output will typically include lines such as `registrar`, `name-server`, `ip6-addr` (IPv6 address), etc.

### Step 2: Analyzing DNS Records
```bash
dig +short <domain-name> NS | grep "ns.*"
dig +short <domain-name> A
```
This step involves using a DNS resolution tool to gather additional information about the domain's name servers and IP addresses. The first command will list the nameservers associated with the domain, while the second command will provide the domain's IPv4 address.

## Expected Results
- A complete WHOIS record containing all relevant information.
- A list of nameservers and their corresponding IP addresses.
- An understanding of the domain's ownership and control structure.

## Common Pitfalls
- Misinterpreting or overlooking critical information in the WHOIS records.
- Not accounting for potential typosquatting or phishing attempts that may masquerade as legitimate domain registrations.
```