```markdown
---
name: kerberoasting-and-as-rep-roasting-detection
description: This skill enables threat-hunters to detect Kerberoasting and AS-REP Roasting attacks using Windows domain credentials. It is useful for identifying potential insiders or lateral movement within an organization's network.
category: security
subcategory: threat-hunting
tools_needed: nmap, python, kerberos cracking tools

# Kerberoasting And As-Rep Roasting Detection

## Purpose
Kerberoasting and AS-REP Roasting are types of attack vectors that exploit the Windows domain environment to gain access to sensitive credentials. These attacks can be used by attackers to obtain elevated privileges or move laterally within a network.

## Prerequisites
- Familiarity with Linux command-line interface
- Knowledge of Kerberos protocol
- Python 3.6 or higher installed

## Procedure

### Step 1: Gather Domain Information and Identify Potential Targets
```bash
nmap -sP <domain> -oN targets.txt
```
This step gathers information about the target domain, including hostnames and IP addresses of potential targets.

### Step 2: Extract Kerberos Ticket Files from Domain Controllers
```python
import pypkerb

# Load kerberos ticket files from the extracted list
tickets = pypkerb.load_tickets('kerberos-tickets.txt')

for ticket in tickets:
    print(ticket)
```
This step extracts and analyzes Kerberos ticket files to identify potential vulnerabilities.

### Step 3: Check for AS-REP Roasting Attacks
```bash
python asrep-roasting-detection.py <ticket-file>
```
This step checks for signs of AS-REP Roasting attacks using a custom Python script.

## Expected Results
A list of compromised Kerberos ticket files and potential targets identified by the nmap scan.

## Common Pitfalls
- Misinterpretation of normal domain activity as an attack
- Failure to account for legitimate use cases of Kerberos protocol

## References
- https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ms dtc/kb/kerberos-overview?redirectedfrom=MSDN
- https://www.pypkerb.org/
```