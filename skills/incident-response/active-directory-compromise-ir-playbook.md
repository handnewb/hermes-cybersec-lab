---
name: active-directory-compromise-ir-playbook
description: This skill addresses an Active Directory compromise by automating incident response activities to contain, investigate, and remediate the breach. It is ideal for use during the initial hours of a security incident when quick action is crucial.
category: security
subcategory: incident-response
tools_needed: PowerShell, Active Directory PowerShell Module, Windows Defender Advanced Threat Protection (ATP)

# Active Directory Compromise Ir Playbook

## Purpose
An Active Directory compromise can lead to unauthorized access to sensitive data and lateral movement within the network. This playbook addresses the initial response to such a breach by quickly containing the damage and initiating an investigation.

## Prerequisites
- Basic understanding of Windows Server and Active Directory environments
- Familiarity with PowerShell scripting

## Procedure

### Step 1: Collect Initial Incident Information
```bash
# Gather incident details using Windows Defender ATP
Get-ADComputer -Filter * | Select-Object Name, DistinguishedName, DomainName, ObjectType
```
Collects the list of affected computers and their respective AD information.

### Step 2: Enable Audit Logs
```powershell
# Enable audit logs for all users to track access attempts
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Defender' -Name 'Enabled' -Type DWORD -Value 1
Enable-EventForwarding -ReceiverAddress <your-forwarding-address> -IncludeGlobalSecurityEvents $true
```
Enables Windows Defender ATP and enables global event forwarding to collect log data.

### Step 3: Review Log Files
```powershell
# Import the Windows Security logs for analysis
Import-Csv -Path C:\temp\security_logs.csv -Delimiter ';' | Format-Table Name, EventID, TimeGenerated, Message
```
Imports the collected security logs into a CSV file for further review and investigation.

### Step 4: Use PowerShell to Scan for Malware
```powershell
# Run a full scan using Windows Defender ATP to detect malware
Search-Process -Name *malware* | Stop-Process -Force
```
Scans the system for malicious processes, then stops them immediately.

## Expected Results
The incident response should contain all affected computers and systems, identify potential vulnerabilities, and have started an investigation into the breach.

## Common Pitfalls
- Not enabling Windows Defender ATP to collect and analyze logs.
- Failing to use PowerShell scripting to automate incident response activities.