---
name: lateral-movement-detection-via-windows-event-logs
description: This skill detects lateral movement in a Windows environment by analyzing Windows event logs for suspicious activity, such as file access and registry changes. It is particularly useful when combined with other threat-hunting skills to identify potential attack vectors. Typically used during post-breach incident response.
category: security
subcategory: threat-hunting
tools_needed: PowerShell, Event Viewer

# Lateral Movement Detection Via Windows Event Logs

## Purpose
Lateral movement occurs when an attacker navigates a network using compromised accounts or stolen credentials, often evading detection by staying one hop away from the initial compromise. This skill addresses the security problem of identifying lateral movement by analyzing Windows event logs for signs of suspicious activity.

## Prerequisites
- Basic knowledge of PowerShell and Event Viewer
- Familiarity with Windows operating system and network fundamentals

## Procedure

### Step 1: Collect Relevant Event Logs
```bash
Get-WinEvent -FilterHashtable @{LogName='Security'; StartTime=(get-date) - (get-date) * 2; Id=4624, 4663} | Export-Csv -Path 'C:\temp\security_events.csv'
```
This step collects security-related event logs from the Windows Event Viewer for a two-hour period, focusing on login attempts and system changes.

### Step 2: Analyze CSV File
```bash
Import-Csv -Path 'C:\temp\security_events.csv' | Where-Object {$_.EventID -in @('4624', '4663')} | Group-Object -Property ComputerName, UserID | Select-String -Pattern '^User\.'
```
This step analyzes the CSV file to identify potential lateral movement. It groups the events by computer name and user ID, then selects any User. events that indicate suspicious activity.

## Expected Results
The script should return a list of users who have accessed multiple computers or systems within the two-hour time frame.

## Common Pitfalls
- Overly broad filter settings can lead to false positives.
- Failure to account for legitimate system activity can result in missed true positives.

## References
- https://docs.microsoft.com/en-us/windows/win32/eventlog/windows-security-event-log
- https://docs.microsoft.com/en-us/windows/security/threat-protection/machine-learning/overview