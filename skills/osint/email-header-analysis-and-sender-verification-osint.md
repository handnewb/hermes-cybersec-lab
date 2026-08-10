---
name: email-header-analysis-and-sender-verification-osint
description: Analyzes email headers to verify sender information and identify potential phishing attempts or spoofing activities using OSINT tools.
category: security
subcategory: osint
tools_needed: Mailparse, HEIMDALL (OSINT tool), DNSlookup

# Email Header Analysis And Sender Verification Osint

## Purpose
This skill addresses the security issue of verifying sender information from email headers to identify potential phishing attempts or spoofing activities. It helps investigators to analyze emails and determine if they are genuine or malicious.

## Prerequisites
- Basic knowledge of OSINT tools, specifically Mailparse.
- Familiarity with DNS lookup methods using HEIMDALL (OSINT tool).

## Procedure

### Step 1: Extract Email Header Information
```bash
mailparse -i email.txt | grep 'From'
```
Extracts the sender's email address from the email header.

### Step 2: Verify Sender Information Using HEIMDALL (OSINT Tool)
```bash
heimdall verify-identities <extracted-email> --lookup-method dns
```
Uses HEIMDALL to perform a DNS lookup on the extracted sender's email address, verifying its authenticity.

## Expected Results
The output should display the verified sender information, including any DNS records that match or do not match the extracted email address.

## Common Pitfalls
- Misinterpreting or misidentifying emails as legitimate when they are actually phishing attempts.
- Overlooking spoofing activities by failing to verify sender information.

## References
- Mailparse documentation: <https://www.mailparse.org/>
- HEIMDALL (OSINT tool) documentation: <https://github.com/heimdall-project/heimdall>