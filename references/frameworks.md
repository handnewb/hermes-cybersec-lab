# Cybersecurity Frameworks & Standards

## MITRE ATT&CK
- **Enterprise Matrix**: 14 tactics, 200+ techniques, 400+ sub-techniques
- **Navigator**: https://mitre-attack.github.io/attack-navigator/
- **Caldera**: Automated adversary emulation (https://github.com/mitre/caldera)
- **Atomic Red Team**: Small, portable detection tests (https://github.com/redcanaryco/atomic-red-team)

### Key ATT&CK Tactics
1. Reconnaissance (TA0043)
2. Resource Development (TA0042)
3. Initial Access (TA0001)
4. Execution (TA0002)
5. Persistence (TA0003)
6. Privilege Escalation (TA0004)
7. Defense Evasion (TA0005)
8. Credential Access (TA0006)
9. Discovery (TA0007)
10. Lateral Movement (TA0008)
11. Collection (TA0009)
12. Command and Control (TA0011)
13. Exfiltration (TA0010)
14. Impact (TA0040)

## MITRE D3FEND
- Countermeasure knowledge base
- Maps defensive techniques to ATT&CK
- https://d3fend.mitre.org/

## MISP — Malware Information Sharing Platform
- **Core**: Threat intelligence sharing (https://github.com/MISP/MISP)
- **Taxonomies**: MISP taxonomies for classification
- **Galaxies**: MISP galaxies for threat actors, TTPs
- **Feeds**: Default feeds (CIRCL, abuse.ch, etc.)
- **STIX/TAXII**: Native import/export

## STIX 2.1 / TAXII 2.1 (OASIS)
- **STIX**: Structured Threat Information Expression
  - SDOs: Attack Pattern, Campaign, Course of Action, Identity, Indicator, Intrusion Set, Malware, Observed Data, Report, Threat Actor, Tool, Vulnerability
  - SROs: Relationship, Sighting
- **TAXII**: Trusted Automated Exchange of Intelligence Information
  - Collections, Channels, Discovery

## CVSS v4.0 (FIRST)
- Base Metrics: Exploitability (AV, AC, AT, PR, UI) + Impact (VC, VI, VA, SC, SI, SA)
- Threat Metrics: Exploit Maturity (E)
- Environmental Metrics: Modified Base + CIA Requirements
- Calculator: https://www.first.org/cvss/calculator/4.0

## EPSS (FIRST)
- Exploit Prediction Scoring System
- Probability (0-1) that a CVE will be exploited in next 30 days
- Percentile ranking among all CVEs
- Data-driven (ML on CISA KEV, Exploit-DB, Metasploit, etc.)
- API: https://api.first.org/data/v1/epss

## CWE — Common Weakness Enumeration
- CWE Top 25 Most Dangerous Software Weaknesses
- CWE/SANS Top 25
- OWASP Top 10 mapping to CWE

## Sigma Rules
- Generic detection rule format
- Supported SIEMs: Splunk, Elastic, QRadar, Sentinel, ArcSight
- Repository: https://github.com/SigmaHQ/sigma
- CLI: `sigma-cli`

## YARA Rules
- Malware identification and classification
- Rule format: `rule Name { meta: ... strings: $a = "pattern" condition: $a }`
- YARA-X (Rust rewrite): faster, modern
- Rule repositories: YARA Rules, ThreatHunting, Neo23x0/signature-base

## OWASP
- **Top 10**: Web application security risks
- **ASVS**: Application Security Verification Standard
- **MASVS**: Mobile Application Security Verification Standard
- **SAMM**: Software Assurance Maturity Model
- **ZAP**: Zed Attack Proxy (DAST tool)

## NIST Cybersecurity Framework (CSF 2.0)
1. **Govern (GV)**: Organizational context, risk strategy
2. **Identify (ID)**: Asset management, risk assessment
3. **Protect (PR)**: Access control, training, data security
4. **Detect (DE)**: Continuous monitoring, detection processes
5. **Respond (RS)**: Response planning, communications, analysis
6. **Recover (RC)**: Recovery planning, improvements, communications

## NIST SP 800-53
- Security and privacy controls for federal information systems
- 20 control families, 1000+ controls

## ISO/IEC 27001:2022
- Information security management systems (ISMS)
- Controls in Annex A: 93 controls in 4 themes
  - Organizational (37), People (8), Physical (14), Technological (34)

## CIS Controls v8
- 18 critical security controls
- Implementation Groups: IG1 (basic), IG2 (medium), IG3 (enterprise)

## CISA Known Exploited Vulnerabilities (KEV)
- Catalog of CVEs known to be actively exploited
- Binding Operational Directive (BOD) 22-01
- https://www.cisa.gov/known-exploited-vulnerabilities-catalog

## PTES — Penetration Testing Execution Standard
1. Pre-engagement Interactions
2. Intelligence Gathering
3. Threat Modeling
4. Vulnerability Analysis
5. Exploitation
6. Post-Exploitation
7. Reporting
- http://www.pentest-standard.org/

## OSCP / OSWE / OSEP Methodology
- OffSec certifications methodology
- Practical hands-on exploitation
- Report writing standards

## Lockheed Martin Cyber Kill Chain
1. Reconnaissance
2. Weaponization
3. Delivery
4. Exploitation
5. Installation
6. Command & Control (C2)
7. Actions on Objectives

## Diamond Model of Intrusion Analysis
- Adversary — Capability — Infrastructure — Victim
- Activity threads across the diamond

## SSVC — Stakeholder-Specific Vulnerability Categorization
- CISA SSVC decision tree
- States: Track, Track*, Attend, Act
- Decision points: Exploitation, Automability, Technical Impact, Mission Prevalence, Public Well-being

## ISA/IEC 62443 (OT/ICS)
- Security for industrial automation and control systems
- Zones and conduits model
- Security levels (SL 1-4)

## MITRE ATLAS (Adversarial Threat Landscape for AI Systems)
- Threat framework for AI-enabled systems
- Maps adversary tactics against ML/AI systems
- Complements ATT&CK for AI-specific threats
- https://atlas.mitre.org/

## MITRE F3 (Fight Fraud Framework)
- Fraud tactics, techniques, and procedures
- Maps fraud kill chain
- Complements ATT&CK for financial threats
- https://fightfraud.mitre.org/

## NIST AI RMF (AI Risk Management Framework)
- AI 100-1: AI Risk Management Framework
- Govern, Map, Measure, Manage functions
- Trustworthy AI characteristics
- https://www.nist.gov/itl/ai-risk-management-framework

## OWASP Top 10 for LLM Applications
- LLM01: Prompt Injection
- LLM02: Insecure Output Handling
- LLM03: Training Data Poisoning
- LLM04: Model Denial of Service
- LLM05: Supply Chain Vulnerabilities
- LLM06: Sensitive Information Disclosure
- LLM07: Insecure Plugin Design
- LLM08: Excessive Agency
- LLM09: Overreliance
- LLM10: Model Theft

## FEND (Federal Emerging Technology Notification Database)
- DHS CISA framework for emerging technology risk
- Complements NIST and MITRE frameworks
- Risk notification for AI, quantum, and emerging tech

## OWASP Agentic Skills Top 10 (AST10)
- First comprehensive security framework for AI agent skills
- Covers all major AI agent platforms (Hermes, Claude, Codex, etc.)
- AST01: Skill Prompt Injection
- AST02: Skill Supply Chain Attack
- AST03: Skill Privilege Escalation
- AST04: Skill Data Exfiltration
- AST05: Skill Persistence & Backdoors
- AST06: Skill Cross-Agent Contamination
- AST07: Skill Tool Misuse
- AST08: Skill Output Manipulation
- AST09: Skill Resource Abuse
- AST10: Skill Evasion & Anti-Forensics
- https://owasp.org/www-project-agentic-skills-top-10/

## OWASP Top 10 for Agentic Applications 2026
- ASI01: Agent Goal Hijack
- ASI02: Tool Misuse & Exploitation
- ASI03: Agent Identity & Privilege Abuse
- ASI04: Multi-Agent Collusion Attacks
- ASI05: Agent Memory Poisoning
- ASI06: Agentic Supply Chain Compromise
- ASI07: Autonomous Decision Exploitation
- ASI08: Agent-to-Agent Lateral Movement
- ASI09: Agentic Data Leakage
- ASI10: Unbounded Agent Autonomy
- https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/

---

*This document evolves with the threat landscape. New frameworks and standards will be added as they become relevant.*
