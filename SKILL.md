---
name: cybersecurity-lab
description: Turnkey cybersecurity lab — 1,927 skills, 152+ tools, 23 frameworks, and evolving methodology for security research, pentesting, forensics, and threat intelligence. Includes one-step ecosystem cloner for 8 repositories.
category: security
---

# Hermes Cybersecurity Lab

**Compatible:** Linux (Ubuntu/Debian) and macOS. Partial Windows support via WSL.

---

## What This Skill Provides

When loaded by Hermes, this skill gives the agent full awareness of:

- **1,927 procedural skills** across 8 repositories — ready-to-execute guides for malware analysis, exploitation, forensics, threat hunting, and more. 247 embedded, 1,680 in external repos cloned by `scripts/clone-all.sh`.
- **152+ security tools** across 13 domains — from nmap to Shuffle SOAR
- **23 frameworks & standards** — MITRE ATT&CK, MISP, CVSS, EPSS, STIX, Sigma, YARA, NIST, ISO 27001, OWASP AST10, Agentic 2026, and more
- **Structured methodology** — passive recon → active scanning → exploitation → forensics → CTI → reporting
- **Knowledge accumulation** — findings, false positives, and lessons compound over time
- **One-shot installer** — `scripts/install.sh` installs everything (with Go, Python, and Ruby deps)
- **One-shot ecosystem cloner** — `scripts/clone-all.sh` clones all 8 repos (1,927 skills) with a single command

---

## Quick Start

```bash
# Install all tools (one command)
bash scripts/install.sh

# Passive recon
nmap -sV -sC -p- --min-rate 1000 <target>

# Web fuzzing
ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u https://TARGET/FUZZ

# Vulnerability scanning
nuclei -u https://TARGET -t ~/nuclei-templates/

# Forensics
binwalk -Me firmware.bin
volatility3 -f memory.dump windows.info

# Threat intelligence
curl -s https://api.first.org/data/v1/epss?cve=CVE-2024-XXXX | jq
```

---

## Documentation Index

| File | Contents |
|---|---|
| **SKILL.md** (this file) | Overview, quick start, core principles |
| `references/tools-ecosystem.md` | 152 tools across 18 categories with install commands |
| `references/skills-catalog.md` | 247 categorized Hermes procedural skills |
| `references/frameworks.md` | 23 cybersecurity frameworks and standards (MITRE, NIST, ISO, OWASP) |
| `references/methodology.md` | Playbooks: recon, scanning, exploitation, forensics |
| `references/findings.md` | Living log — discoveries, IOCs, lessons learned |
| `scripts/install.sh` | One-shot installer for all 152+ tools + wordlists |
| `scripts/clone-all.sh` | One-shot ecosystem cloner — 8 repos, 1,927 skills |

---

## Core Principles

- **Passive before active** — enumerate without touching the target first
- **Document as you go** — every command and its output is evidence
- **Least privilege** — use the minimum access needed for each step
- **Clean exit** — restore any modified state before disconnecting
- **Verify, don't assume** — every finding gets corroboration before reporting

---

## Workflow

```
1. Scoping & Authorization
   └─ confirm scope, rules of engagement, contact info

2. Passive Recon
   └─ WHOIS, DNS, certificate transparency, Shodan, OSINT
   └─ skills: conducting-external-reconnaissance-with-osint

3. Active Scanning (with authorization)
   └─ nmap, masscan, naabu (ports)
   └─ ffuf, dirsearch (web paths)
   └─ nuclei (vulnerabilities)
   └─ skills: scanning-network-with-nmap-advanced

4. Exploitation (PoC only)
   └─ metasploit, searchsploit, sqlmap, impacket
   └─ skills: exploiting-vulnerabilities-with-metasploit-framework

5. Post-Exploitation Analysis
   └─ credential extraction, lateral movement, persistence check
   └─ skills: post-exploiting-microsoft-graph-with-graphrunner

6. Documentation & Evidence
   └─ screenshots, logs, reproduction steps
   └─ add to references/findings.md

7. Cleanup & Reporting
   └─ remove artifacts, restore state
   └─ remediation guidance per finding
```

---

## Knowledge Accumulation Rules

1. Every completed engagement adds a **dated entry** to `references/findings.md`
2. New tools discovered during engagements are added to `references/tools-ecosystem.md`
3. Methodology improvements are appended to `references/methodology.md`
4. False positives and dead ends are documented to prevent repetition
5. IOCs are logged with source, timestamp, and confidence level

---

*This skill is a living document. It improves with every engagement.*
