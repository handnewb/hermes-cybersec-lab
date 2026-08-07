# Cybersecurity Tools Ecosystem

> Complete toolkit for red team, blue team, DFIR, CTI, and security engineering.
> Sources: MITRE ATT&CK, MISP, CVSS, EPSS, ExploitDB, and the open-source community.

---

## 🔍 Network Reconnaissance & Scanning

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **nmap** | Scanner | Port scanning, service detection, OS fingerprinting | `apt install nmap` |
| **masscan** | Scanner | Mass IP port scanner (internet-scale) | `apt install masscan` |
| **rustscan** | Scanner | Faster nmap alternative (Rust) | `cargo install rustscan` |
| **naabu** | Scanner | Fast port scanner (ProjectDiscovery) | `go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest` |
| **dnsrecon** | DNS | DNS enumeration and recon | `apt install dnsrecon` |
| **amass** | Subdomain | DNS enumeration, subdomain discovery | `go install -v github.com/owasp-amass/amass/v4/...@master` |
| **subfinder** | Subdomain | Passive subdomain discovery | `go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest` |
| **shodan-cli** | OSINT | Shodan search from CLI | `pip install shodan` |
| **tcpdump** | Sniffer | Packet capture and analysis | `apt install tcpdump` |
| **tshark** | Sniffer | Terminal Wireshark | `apt install tshark` |
| **bettercap** | MITM | Network attacks and monitoring | `apt install bettercap` |

## ⚔️ Exploitation Frameworks

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Metasploit** | Framework | Exploitation framework | `apt install metasploit-framework` |
| **searchsploit** | Exploit DB | Offline Exploit-DB search | `apt install exploitdb` |
| **sqlmap** | SQLi | Automated SQL injection | `apt install sqlmap` |
| **xsstrike** | XSS | Advanced XSS detection | `pip install xsstrike` |
| **commix** | CMDi | Command injection exploitation | `pip install commix` |
| **hydra** | Bruteforce | Login bruteforce | `apt install hydra` |
| **john** | Cracking | Password cracking | `apt install john` |
| **hashcat** | Cracking | GPU-accelerated cracking | `apt install hashcat` |
| **impacket** | AD/Windows | Windows network protocols | `pip install impacket` |
| **crackmapexec** | AD | Swiss army knife for pentesting AD | `pip install crackmapexec` |
| **certipy** | ADCS | Active Directory Certificate Services exploitation | `pip install certipy-ad` |
| **bloodhound-python** | AD | Active Directory attack path mapping | `pip install bloodhound` |
| **responder** | LLMNR | LLMNR/NBT-NS/mDNS poisoner | `apt install responder` |
| **evil-winrm** | WinRM | Windows Remote Management shell | `gem install evil-winrm` |
| **mimikatz** | Credential | Credential dumping (Windows) | Manual download |
| **pacu** | AWS | AWS exploitation framework | `pip install pacu` |
| **pwncat** | C2 | Post-exploitation C2 framework | `pip install pwncat-cs` |

## 🔬 Malware Analysis & Reverse Engineering

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Ghidra** | RE | NSA reverse engineering framework | Manual download |
| **radare2** | RE | Reverse engineering framework | `apt install radare2` |
| **x64dbg** | Debugger | Windows x64 debugger | Windows only |
| **gdb** | Debugger | GNU debugger | `apt install gdb` |
| **apktool** | APK | Android APK analysis | `apt install apktool` |
| **jadx** | Dex | Dex-to-Java decompiler | Manual download |
| **dnSpy** | .NET | .NET decompiler/debugger | Windows only |
| **ollydbg** | Debugger | 32-bit Windows debugger | Windows only |
| **Cuckoo Sandbox** | Sandbox | Automated malware analysis | `pip install cuckoo` |
| **CAPE** | Sandbox | Automated malware analysis (Cuckoo fork) | Manual install |
| **VirusTotal API** | Enrichment | File/URL lookup | `pip install vt-py` |
| **YARA** | Patterns | Malware identification patterns | `apt install yara` |
| **pefile** | PE | PE file analysis (Python) | `pip install pefile` |
| **oletools** | OLE | OLE/MS Office analysis | `pip install oletools` |
| **pdf-parser** | PDF | PDF structure analysis | `pip install pdf-parser` |
| **binwalk** | Firmware | Firmware analysis and extraction | `apt install binwalk` |
| **foremost** | Carving | File carving and data recovery | `apt install foremost` |
| **UPX** | Packer | Executable packer/unpacker | `apt install upx-ucl` |

## 🧬 Forensics & DFIR

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Volatility 3** | Memory | Memory forensics framework | `pip install volatility3` |
| **Velociraptor** | Endpoint | Advanced DFIR platform | Manual download |
| **GRR Rapid Response** | Endpoint | Remote live forensics (Google) | `pip install grr-response` |
| **Autopsy** | Disk | Digital forensics platform | `apt install autopsy` |
| **Plaso** | Timeline | Log2timeline / super timeline | `pip install plaso` |
| **Hayabusa** | Timeline | Windows event log forensics | Manual download |
| **Hindsight** | Browser | Browser forensics | Manual download |
| **bulk_extractor** | Carving | Bulk data extraction | `apt install bulk-extractor` |

## 🛡️ Vulnerability Management

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Nessus** | Scanner | Vulnerability scanner (Tenable) | Manual download |
| **OpenVAS/Greenbone** | Scanner | Open source vuln scanner | `apt install openvas` |
| **Nuclei** | Scanner | Template-based vuln scanning | `go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest` |
| **Trivy** | Scanner | Container/image vuln scanner | `apt install trivy` |
| **DefectDojo** | Management | Vuln management platform | Docker |
| **Dependency-Check** | SCA | Software composition analysis | Manual download |
| **EPSS API** | Scoring | Exploit prediction scoring | `pip install requests` |
| **CVSS Calculator** | Scoring | CVSS v3.1/v4.0 calculation | `pip install cvss` |

## 🌐 Web Application Security

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Burp Suite** | Proxy | Web app testing platform | Manual download |
| **OWASP ZAP** | Scanner | Web app security scanner | `apt install zaproxy` |
| **ffuf** | Fuzzer | Fast web fuzzer | `go install github.com/ffuf/ffuf/v2@latest` |
| **dirsearch** | Fuzzer | Web path brute-forcing | `pip install dirsearch` |
| **wafw00f** | Detection | WAF detection | `pip install wafw00f` |
| **nikto** | Scanner | Web server scanner | `apt install nikto` |
| **wpscan** | Scanner | WordPress vulnerability scanner | `gem install wpscan` |

## ☁️ Cloud Security

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **ScoutSuite** | Audit | Multi-cloud security audit | `pip install scoutsuite` |
| **Prowler** | Audit | AWS security assessment | `pip install prowler` |
| **CloudSploit** | Audit | Cloud security scanning (Aqua) | `git clone ...` |
| **kube-bench** | Audit | Kubernetes CIS benchmark | Manual download |
| **kube-hunter** | Pentest | Kubernetes security testing | `pip install kube-hunter` |
| **Falco** | Detection | Cloud-native runtime security | `apt install falco` |
| **Tetragon** | Detection | eBPF-based security observability | Manual download |
| **checkov** | IaC | Infrastructure-as-Code scanning | `pip install checkov` |
| **tfsec** | IaC | Terraform security scanner | `go install github.com/aquasecurity/tfsec/cmd/tfsec@latest` |
| **terrascan** | IaC | IaC security scanner | Manual download |

## 🧠 Threat Intelligence (CTI)

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **MISP** | Platform | Threat intelligence sharing | Docker/Manual |
| **OpenCTI** | Platform | Threat intelligence knowledge base | Docker |
| **Yeti** | Platform | CTI and DFIR platform | Docker |
| **MITRE ATT&CK Navigator** | Framework | TTP visualization | Web-based |
| **MITRE Caldera** | Emulation | Adversary emulation | `git clone ...` |
| **Atomic Red Team** | Emulation | Atomic test execution | `git clone ...` |
| **TheHive** | IR | Incident response platform | Docker |
| **Cortex** | Automation | Observable analysis (TheHive) | Docker |
| **Shuffle** | SOAR | Security orchestration automation | Docker |
| **n8n** | SOAR | Workflow automation | Docker |
| **Sigma** | Detection | Generic detection rule format | `pip install sigma-cli` |

## 🏭 OT/ICS/SCADA Security

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Claroty** | Assessment | OT vulnerability assessment | Commercial |
| **GRASSMARLIN** | Passive | SCADA network mapping | Manual download |
| **ModbusPal** | Simulation | Modbus slave simulator | Manual download |
| **s7scan** | Scanner | Siemens S7 enumeration | `pip install s7scan` |
| **PLCinject** | Testing | PLC code injection testing | Manual download |

## 🔑 Active Directory Security

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **BloodHound CE** | Mapping | AD attack path visualization | Docker |
| **PingCastle** | Audit | AD security assessment | Manual download |
| **PurpleKnight** | Audit | AD/Entra security assessment | Manual download |
| **adalanche** | Mapping | AD attack path analysis | `go install ...` |
| **NetExec** | C2 | Network execution (CrackMapExec fork) | `pip install netexec` |

## 📡 OSINT & Intelligence Gathering

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **SpiderFoot** | OSINT | Automated OSINT platform | `pip install spiderfoot` |
| **theHarvester** | OSINT | Email/subdomain/name gathering | `apt install theharvester` |
| **Recon-ng** | OSINT | Web reconnaissance framework | `apt install recon-ng` |
| **Maltego** | OSINT | Link analysis and data mining | Manual download |
| **holehe** | OSINT | Email account verification | `pip install holehe` |
| **sherlock** | OSINT | Username search across platforms | `pip install sherlock-project` |
| **twint** | OSINT | Twitter scraping | `pip install twint` |
| **Photon** | OSINT | Web crawler for data extraction | `pip install photon` |

## 🔧 Security Operations (SOC/SIEM/SOAR)

| Tool | Category | Description | Install |
|------|----------|-------------|---------|
| **Wazuh** | SIEM/XDR | Open source security platform | Docker/Manual |
| **Elastic SIEM** | SIEM | ELK-based SIEM | Docker |
| **Splunk** | SIEM | Enterprise SIEM | Manual download |
| **Graylog** | Log Mgmt | Log management platform | Docker |
| **Shuffle** | SOAR | Security automation | Docker |
| **n8n** | SOAR | Workflow automation | Docker |
| **StackStorm** | SOAR | Event-driven automation | Docker |
| **Cortex (TheHive)** | Automation | Observable enrichment | Docker |

## 📊 Standards & Frameworks

| Framework | Provider | Purpose |
|-----------|----------|---------|
| **MITRE ATT&CK** | MITRE | Adversary TTP taxonomy |
| **MITRE D3FEND** | MITRE | Defensive countermeasures |
| **MITRE CAPEC** | MITRE | Attack patterns catalog |
| **MISP** | Community | Threat sharing (STIX/TAXII) |
| **STIX 2.1** | OASIS | Structured threat information |
| **TAXII 2.1** | OASIS | Threat intelligence transport |
| **CVSS v4.0** | FIRST | Vulnerability severity scoring |
| **EPSS** | FIRST | Exploit prediction scoring |
| **CVE** | MITRE | Common vulnerability identifiers |
| **CWE** | MITRE | Common weakness enumeration |
| **OWASP Top 10** | OWASP | Web application risks |
| **NIST CSF** | NIST | Cybersecurity framework |
| **NIST 800-53** | NIST | Security controls catalog |
| **ISO 27001** | ISO | Information security management |
| **Sigma Rules** | Community | Detection rule format |
| **YARA Rules** | Community | Malware pattern matching |

---

## Tool Count Summary

| Category | Tools |
|---|---|
| Network Recon & Scanning | 11 |
| Exploitation Frameworks | 17 |
| Malware Analysis & RE | 18 |
| Forensics & DFIR | 8 |
| Vulnerability Management | 8 |
| Web Application Security | 7 |
| Cloud Security | 10 |
| Threat Intelligence (CTI) | 10 |
| OT/ICS/SCADA | 5 |
| Active Directory Security | 5 |
| OSINT | 8 |
| SOC/SIEM/SOAR | 8 |
| Standards & Frameworks | 16 |
| **TOTAL** | **131 tools + 16 frameworks** |
