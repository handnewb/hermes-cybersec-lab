---
name: business-email-compromise-target-profiling
description: This skill is used to profile potential targets for Business Email Compromise (BEC) attacks, utilizing Open-Source Intelligence (OSINT) methods to gather information about high-value targets and their email habits. It can be employed to identify vulnerable organizations and individuals before an attack occurs.
category: security
subcategory: osint
tools_needed: Excel, Google Sheets, Maltego, Hunter

## Business Email Compromise Target Profiling

## Purpose
Business Email Compromise (BEC) attacks are a growing threat to businesses and organizations. Identifying potential targets and understanding their email habits is crucial in preventing these types of attacks. This skill provides a method for gathering OSINT data on high-value targets, helping defenders identify vulnerabilities before an attack occurs.

## Prerequisites
- Basic proficiency in using Excel or Google Sheets for data analysis
- Familiarity with Maltego for network and domain reconnaissance
- Knowledge of Hunter API for email verification

## Procedure

### Step 1: Gather Target Data
```bash
# Use Hunter API to gather target company information
hunter api --api-key YOUR_API_KEY --domain YOUR_TARGET_DOMAIN
```
Gather all relevant information about the target company, including employees and executives.

### Step 2: Analyze Email Habits
```bash
# Use Excel or Google Sheets to analyze email habits
=JOIN(A1:B10,B10:A1)&"@"&B11
```
Analyze the email habits of key personnel at the target company. Identify common domains, email patterns, and communication channels.

### Step 3: Identify Potential Vulnerabilities
```bash
# Use Maltego to identify potential vulnerabilities
maltego -t domain --input=YOUR_TARGET_DOMAIN
```
Use Maltego to gather information on the target's domain, including subdomains, IP addresses, and DNS records. Analyze this data for potential vulnerabilities that could be exploited in a BEC attack.

## Expected Results
- A list of high-value targets at the company, including employees and executives
- An analysis of common email habits and communication channels
- Potential vulnerabilities identified through Maltego

## Common Pitfalls
- Over-reliance on Hunter API for all target data
- Failure to analyze email patterns and habits thoroughly
- Misinterpretation of DNS records as a vulnerability