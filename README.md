# 🛡️ Hermes Cybersecurity Lab

**Turnkey cybersecurity lab for Hermes Agent** — preconfigured toolkit with 15+ tools, wordlists, forensics, and automated daily intelligence updates.

## What This Skill Provides

When loaded by Hermes, this skill gives the agent:

- **Tool inventory awareness** — knows exactly which security tools are installed and where
- **Structured methodology** — passive recon → active scanning → exploitation → forensics
- **Knowledge accumulation** — findings, false positives, and lessons are logged for future sessions
- **Daily updates** — cron job keeps tools, wordlists, and nuclei templates current

## Toolkit

| Category | Tools |
|---|---|
| 🔍 **Network** | nmap, tcpdump, netcat, masscan |
| 🔬 **Forensics** | binwalk, foremost, volatility3 |
| 🔧 **Analysis** | radare2, gdb |
| 🌐 **Web/API** | sqlmap, ffuf, nuclei |
| 🐍 **Python** | scapy, impacket, pwntools |

## Quick Start

```bash
# Copy skill to your Hermes profile
cp -r cybersecurity-lab ~/.hermes/profiles/<profile>/skills/

# Install tools (Ubuntu/Debian)
./scripts/install.sh
```

## Files

| File | Purpose |
|---|---|
| `SKILL.md` | Main skill — inventory, methodology, quick refs |
| `references/methodology.md` | Playbooks for recon, scanning, forensics |
| `references/findings.md` | Log of discoveries and lessons learned |
| `scripts/install.sh` | One-shot installer for all tools |

## Submit Findings

Found something interesting? Add it to `references/findings.md` after each engagement so the agent's knowledge compounds over time.

## License

MIT — use freely, contribute back.
