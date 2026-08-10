# 🛡️ Hermes Cybersecurity Lab

**Turnkey cybersecurity ecosystem for Hermes Agent** — **1,927 skills**, **152 tools**, **23 frameworks** across 8 repositories. Preconfigured toolkit with wordlists, forensics, and evolving methodology for security research, pentesting, forensics, threat hunting, and threat intelligence.

## 📊 Ecosystem at a Glance

| Layer | Count | Location |
|---|---|---|
| **Skills** | **1,927** | 247 embedded + 1,680 across 7 external repos |
| **Tools** | **152** | Installed via `scripts/install.sh` — network, forensics, exploitation, cloud, CTI |
| **Frameworks** | **28** | MITRE ATT&CK/D3FEND/ATLAS/F3/FEND, NIST CSF/RMF, ISO 27001, OWASP (Web/LLM/AST10), CIS, CVSS, EPSS, Sigma, YARA, STIX, CWE, PTES, Cyber Kill Chain, Diamond Model, SSVC, IEC 62443 |

```
                     ┌──────────────────────────────┐
                     │  hermes-cybersec-lab (core)  │
                     │  247 skills · 152 tools      │
                     │  28 frameworks · install.sh  │
                     └──────────┬───────────────────┘
                                │ clone-all.sh
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
   ┌──────▼──────┐    ┌────────▼────────┐    ┌───────▼───────┐
   │ Skill repos │    │  Playbook repos │    │  Reference    │
   │  817 + 700+ │    │   31 + 31       │    │  curated × 2  │
   │  + 101+     │    │                 │    │               │
   └─────────────┘    └─────────────────┘    └───────────────┘
```

## 🚀 Quick Start

### 1. Clone everything (one command)

```bash
# Clone this repo
git clone https://github.com/handnewb/hermes-cybersec-lab.git
cd hermes-cybersec-lab

# Clone all 7 external repos (1,997 skills total)
bash scripts/clone-all.sh
```

This pulls every referenced repository into `./external/` — no piecemeal manual cloning.

### 2. Install all tools (one command)

```bash
bash scripts/install.sh
```

Installs 152 tools across 7 phases: network recon, exploitation, malware analysis, forensics, web/cloud, CTI/OSINT, and wordlists.

### 3. Load in Hermes

```bash
cp -r . ~/.hermes/profiles/<profile>/skills/cybersecurity-lab/
```

## 🔧 What This Skill Provides

When loaded by Hermes, this skill gives the agent:

- **Full ecosystem awareness** — knows all 1,927 skills and which external repo holds each one
- **Tool inventory awareness** — knows which 152 security tools are installed and where
- **Structured methodology** — passive recon → active scanning → exploitation → forensics → CTI → reporting
- **Knowledge accumulation** — findings, false positives, and lessons compound over time
- **Daily updates** — keep tools, wordlists, and nuclei templates current

## 📁 Repo Structure

```
hermes-cybersec-lab/
├── SKILL.md                          # Main skill — inventory, methodology, quick refs
├── README.md                         # This file
├── references/
│   ├── skills-catalog.md             # 247 embedded Hermes procedural skills (15 domains)
│   ├── tools-ecosystem.md            # 152 tools across 18 categories with install commands
│   ├── frameworks.md                 # 23 cybersecurity frameworks and standards
│   ├── methodology.md                # Playbooks: recon, scanning, exploitation, forensics
│   └── findings.md                   # Living log — discoveries, IOCs, lessons learned
├── scripts/
│   ├── install.sh                    # One-shot installer for all 152 tools + wordlists
│   └── clone-all.sh                  # One-shot cloner for all 8 ecosystem repos
└── external/                         # Created by clone-all.sh — 7 external repos
```

## 🌐 External Repositories

| # | Repository | Skills | Focus |
|---|---|---|---|
| 1 | [Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills) | **817** | Largest cybersecurity skill collection; 29 domains |
| 2 | [awesome-hermes-agent](https://github.com/0xarkstar/awesome-hermes-agent) | **700+** | Curated Hermes security resources with mapped skills |
| 3 | [awesome-hermes-skills](https://github.com/ZeroPointRepo/awesome-hermes-skills) | **101+** | Curated skill directory |
| 4 | [violin](https://github.com/Strategic-Automation/violin) | **31** | Supervised Hermes pentest profile with guard plugin |
| 5 | [awesome-ai-security](https://github.com/gmh5225/awesome-ai-security) | **31** | AI security + Hermes pentest references |
| 6 | [awesome-hermes-agent](https://github.com/0xNyk/awesome-hermes-agent) | curated | Skills, tools, integrations directory |
| 7 | [awesome-hermes-agent-skills](https://github.com/frankxai/awesome-hermes-agent-skills) | curated | Best Hermes-compatible skills and skill factories |

## 📋 Skill Domains (embedded 317)

| Domain | Skills |
|---|---|
| 🔬 Malware Analysis & Reverse Engineering | 34 |
| 🔍 Forensics & DFIR | 22 |
| ⚔️ Exploitation & Post-Exploitation | 40 |
| 🧠 Threat Intelligence (CTI) | 32 |
| 🛡️ Vulnerability Management | 22 |
| ☁️ Cloud Security | 18 |
| 🌐 Web Application Security | 14 |
| 🏭 OT/ICS/SCADA Security | 10 |
| 🔎 OSINT & Reconnaissance | 5 |
| 🚨 Incident Response | 6 |
| 🎯 Threat Hunting & Detection | 7 |
| 🔧 Security Implementation & Hardening | 34 |
| 📡 API Security | 12 |

## 🔧 Tool Categories (152 tools)

| Category | Tools |
|---|---|
| 📡 Network | nmap, masscan, tcpdump, tshark, naabu, amass, subfinder, bettercap, dnsrecon, hydra, john |
| ⚔️ Exploitation | metasploit, searchsploit, sqlmap, impacket, crackmapexec, certipy, bloodhound, pacu, responder, evil-winrm |
| 🔬 Malware/RE | radare2, gdb, ghidra*, binwalk, foremost, upx, yara, pefile, oletools, pdf-parser, cuckoo*, vt-py |
| 🔍 Forensics | volatility3, velociraptor*, hayabusa*, plaso |
| 🌐 Web | zaproxy, nikto, ffuf, wafw00f, dirsearch, xsstrike, commix |
| ☁️ Cloud | scoutsuite, prowler, kube-hunter, checkov, trivy |
| 🛡️ Vuln Mgmt | nuclei, nessus* |
| 🧠 CTI | sigma-cli, spiderfoot, theharvester, recon-ng |
| 📚 Wordlists | SecLists, rockyou |

*\* requires manual installation*

## 📊 Frameworks & Standards (23)

MITRE ATT&CK · MITRE D3FEND · MITRE ATLAS · MITRE F3 · MITRE FEND · MISP · STIX/TAXII · CVSS v4.0 · EPSS · CWE · Sigma · YARA · OWASP Top 10 · OWASP ASVS · OWASP LLM Top 10 · OWASP AST10 · OWASP Agentic 2026 · NIST CSF 2.0 · NIST SP 800-53 · NIST AI RMF · ISO 27001 · CIS Controls v8 · CISA KEV · PTES · Cyber Kill Chain · Diamond Model · SSVC · IEC 62443

## 🤝 Submit Findings

Found something interesting? Add it to `references/findings.md` after each engagement so the agent's knowledge compounds over time.

## 📜 License

MIT — use freely, contribute back.

---

*This is a living lab. Tools, skills, and methodology improve with every engagement.*
