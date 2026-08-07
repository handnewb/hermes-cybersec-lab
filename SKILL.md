---
name: cybersecurity-lab
description: Mestre's cybersecurity lab — toolkit inventory, knowledge base, and evolving methodology for security research, pentesting, forensics, and threat intelligence.
category: security
---

# Cybersecurity Lab — Mestre

**Host:** Mestre (100.96.33.101 · Ubuntu 24.04 · 47 GB RAM · 435 GB free)

## Toolkit Inventory

### Network
| Tool | Version | Path |
|------|---------|------|
| nmap | 7.94SVN | `/usr/bin/nmap` |
| tcpdump | 4.99.4 | `/usr/bin/tcpdump` |
| netcat | OpenBSD | `/usr/bin/nc` |
| masscan | latest | `/usr/bin/masscan` |

### Forensics
| Tool | Version | Path |
|------|---------|------|
| binwalk | latest | `/usr/bin/binwalk` |
| foremost | latest | `/usr/bin/foremost` |
| volatility3 | 2.28.0 | pip |

### Analysis / Reverse Engineering
| Tool | Version | Path |
|------|---------|------|
| radare2 | latest | `/usr/bin/radare2` |
| gdb | latest | `/usr/bin/gdb` |

### Web / API
| Tool | Version | Path |
|------|---------|------|
| sqlmap | latest | `/usr/bin/sqlmap` |
| ffuf | latest | `/usr/bin/ffuf` |
| nuclei | latest | `/root/go/bin/nuclei` |

### Python Stack
| Package | Version |
|---------|---------|
| scapy | 2.7.0 |
| impacket | 0.13.1 |
| pwntools | 4.15.0 |
| pycryptodomex | latest |
| volatility3 | 2.28.0 |

### Wordlists
| Resource | Size | Path |
|----------|------|------|
| SecLists | 2.5 GB | `/usr/share/seclists/` |
| rockyou | 14.3M lines | `/usr/share/wordlists/rockyou.txt.gz` |

## Knowledge Accumulation Rules

1. Every completed security engagement, analysis, or finding adds a dated entry to this skill's `references/findings.md`.
2. New tools discovered during engagements are added to the inventory above.
3. Methodology improvements are appended to `references/methodology.md`.
4. False positives and dead ends are documented to prevent repetition.

## Core Principles

- **Passive before active** — enumerate without touching the target first.
- **Document as you go** — every command and its output is evidence.
- **Least privilege** — use the minimum access needed for each step.
- **Clean exit** — restore any modified state before disconnecting.

## Quick Start

```bash
# Passive recon
nmap -sV -sC -p- --min-rate 1000 <target>

# Active scan (with authorization only)
nmap -A -p- <target>

# Web fuzzing
ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u https://TARGET/FUZZ

# Forensics
binwalk -Me firmware.bin
volatility3 -f memory.dump windows.info

# Network capture
tcpdump -i eth0 -w capture.pcap
```
