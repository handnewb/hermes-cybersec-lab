---
name: threat-actor-infrastructure-mapping
description: This skill enables the creation of a comprehensive map of a malicious actor's infrastructure using Open Source Intelligence (OSINT) tools. It is useful for threat actors and security professionals to understand the tactics, techniques, and procedures (TTPs) used by adversaries.
category: security
subcategory: osint
tools_needed: Maltego, Nmap, OSINT Collector

# Threat Actor Infrastructure Mapping

## Purpose
Threat actor infrastructure mapping helps identify and visualize the command and control (C2) servers, domains, and other communication channels used by malicious actors. This skill addresses the security problem of understanding an adversary's operational model to inform incident response and mitigation strategies.

## Prerequisites
- Knowledge of basic OSINT tools and techniques.
- Familiarity with Maltego and its integration with Nmap.

## Procedure

### Step 1: Network Discovery Using Nmap
```bash
nmap -sT -A --open -P0 [target IP or domain]
```
This step discovers the target's network infrastructure by scanning for open ports and services. The `-sT` flag performs a TCP connect scan, while `--open` specifies only open ports to scan.

### Step 2: Domain Research Using Maltego
```bash
Maltego -f <target domain> -o export
```
This step extracts and visualizes the target's domain history using Maltego. The `-f` flag specifies the input file, and `--export` formats the output for analysis.

## Expected Results
A comprehensive network diagram showing open ports and services, as well as a historical domain report detailing domain registrations and transfers.

## Common Pitfalls
- Misinterpreting DNS records as indicators of malicious activity.
- Overlooking hidden or encrypted C2 communication channels.

## References
- Open Source Intelligence (OSINT) techniques and best practices.
- Maltego documentation and user guide.