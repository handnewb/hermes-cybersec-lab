# Methodology

## Passive Reconnaissance
1. WHOIS / DNS enumeration (whois, dig, nslookup)
2. Certificate transparency logs (crt.sh)
3. Shodan / Censys passive checks
4. GitHub/leak search for credentials
5. Wayback Machine for historical endpoints

## Active Scanning (with authorization only)
1. Host discovery (nmap -sn)
2. Port scanning (nmap -sV -sC)
3. Service enumeration
4. Web directory fuzzing (ffuf, gobuster)
5. Vulnerability scanning (nuclei)

## Exploitation
1. Verify findings are real (not false positives)
2. Document every command
3. Screenshot every success
4. Stop at proof-of-concept — do not exfiltrate or pivot without explicit scope

## Post-Exploitation
1. Clean up artifacts
2. Document exact steps for reproduction
3. Provide remediation guidance per finding

## Forensics
1. Acquire disk/memory image with verified hash
2. Timeline analysis
3. Artifact extraction
4. Report with chain of custody

*Methodology evolves with each engagement. Update this file with lessons learned.*
