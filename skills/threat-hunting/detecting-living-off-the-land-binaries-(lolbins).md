---
name: detecting-living-off-the-land-binaries-(lolbins)
description: Detects Living-off-the-Land binaries (LOLBins) using a combination of file hash matching and binary analysis in Linux systems, ideal for threat-hunting teams that need to identify potential APT or ransomware attacks. This skill is particularly useful when combined with other tools like Nmap and network traffic analysis.
category: security
subcategory: threat-hunting
tools_needed: nmap, strings, xxd

# Detecting Living-Off-The-Land Binaries (Lolbins)

## Purpose
Living-off-the-Land binaries are often used by attackers to move laterally within a network or deliver ransomware payloads. Identifying these bins is crucial for threat-hunters as it can indicate an APT or ransomware attack.

## Prerequisites
- Familiarity with Linux command-line tools and basic networking concepts.
- Ability to use Nmap to scan ports and identify running services.

## Procedure

### Step 1: Identify potential LOLbins using Nmap
```bash
nmap --script=vulnerability -oN all_bins.txt 192.168.1.0/24
```
This command scans the specified network range for open ports and identifies potential vulnerabilities, which can include running LOLbins.

### Step 2: Analyze the hashes of identified bins using strings and xxd
```bash
for hash in $(grep "SHA256" all_bins.txt | cut -d' ' -f1); do
    grep -a "$hash" /usr/bin/* | xxd -p
done
```
This step uses `strings` to analyze the contents of identified bins and `xxd` to print their hexadecimal hashes, allowing for further analysis.

## Expected Results
The successful execution of this skill will result in a list of identified LOLbins along with their corresponding hashes, which can be used to investigate potential APT or ransomware attacks.

## Common Pitfalls
- Misinterpreting benign network activity as an LOLbin.
- Incorrectly identifying a hash that has been compromised by an attacker.

## References
- https://nmap.org/nscriptx/vulns.html
- https://www.sans.com/security-awareness-training/learning-materials/binary-analysis-101-basics