---
name: threat-actor-infrastructure-mapping
description: This skill enables threat actors to visualize and analyze an adversary's infrastructure by collecting and mapping publicly available domain and IP information using OSINT tools like WHOIS, DNS, and social media intelligence. It helps analysts identify patterns, connections, and potential command-and-control servers, facilitating more effective threat actor profiling.
category: security
subcategory: osint
tools_needed: whois, dig, dnsenum, social media analytics tools

## Purpose
Threat actor infrastructure mapping is essential for understanding the scope and reach of a cybercrime campaign. By analyzing an adversary's digital footprint, analysts can identify vulnerabilities, predict future attacks, and disrupt command-and-control networks.

## Prerequisites
- Basic knowledge of OSINT tools like WHOIS and DNS lookup.
- Familiarity with social media intelligence tools for collecting publicly available information about individuals or organizations.

## Procedure

### Step 1: Collect Public DNS Information
```bash
whois -d example.com
```
Collecting public DNS information helps identify potential domain registration details, contact information, and other metadata that might be linked to the threat actor's infrastructure. Analyze WHOIS output for domain registrant information, IP addresses associated with domains, and any registrar-related details.

### Step 2: Enumerate Threat Actor Hosts
```bash
dig +short -x 8.8.8.8 | grep "example" | cut -d '.' -f 4-6
dnsenum -i 8.8.8.8 -t A,AAAA | grep example.com
```
This step involves using DNS enumeration tools to identify potential domain names or IP addresses associated with the threat actor's infrastructure. The output can reveal additional hostnames, domains, or IP addresses linked to the adversary.

## Expected Results
The successful execution of this skill should yield a comprehensive list of identified threat actors' hosts, including domains and IP addresses. Analyzing these findings helps create a map of the adversary's network infrastructure.

## Common Pitfalls
- Overlooking domain names with variations in top-level domains (TLDs), which might indicate different country-specific registrants.
- Failing to account for domain name parking or proxy sites, which can serve as fronts for malicious activity.