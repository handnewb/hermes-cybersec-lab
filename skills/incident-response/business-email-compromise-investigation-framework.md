---
name: business-email-compromise-investigation-framework
description: This skill provides a structured approach to investigating Business Email Compromise (BEC) incidents, helping responders identify and mitigate potential phishing attacks. It's ideal for use when an organization is victimized by BEC tactics and needs a thorough, methodical investigation process.
category: security
subcategory: incident-response
tools_needed: ThreatHunter, Azure Active Directory, Office 365 Security & Compliance Center

# Business Email Compromise Investigation Framework

## Purpose
Business Email Compromise (BEC) investigations require swift action to minimize financial loss and prevent future attacks. This framework provides a structured approach to identifying and mitigating BEC incidents, utilizing tools like ThreatHunter and Azure Active Directory.

## Prerequisites
- Familiarity with Office 365 Security & Compliance Center, including its features and capabilities.
- Knowledge of threat hunting techniques using tools like ThreatHunter.

## Procedure

### Step 1: Gather Initial Evidence
```bash
ThreatHunter.exe -search "suspicious email" -output C:\BEC\Initial_Evidence.txt
```
Collect initial evidence by running a ThreatHunter search for suspicious emails. This step helps identify potential phishing attacks and provides the foundation for further investigation.

### Step 2: Analyze Email Headers and Content
```powershell
Get-ADUser -Identity <SenderEmail> | Select-Object * | ConvertTo-Json > C:\BEC\Analyst_Info.json
```
Analyze email headers, content, and sender information using PowerShell. This step helps identify potential spoofing or identity theft tactics used in the attack.

## Expected Results
Success looks like successful identification of suspicious emails, complete analysis of email metadata, and accurate documentation of evidence for later reference.

## Common Pitfalls
- Insufficient training on new phishing tactics.
- Inadequate use of threat intelligence to inform investigation.