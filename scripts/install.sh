#!/bin/bash
# 🛡️ Hermes Cybersecurity Lab — Comprehensive Installer
# Installs 130+ tools across all cybersecurity domains
# Run: bash scripts/install.sh
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log()  { echo -e "${GREEN}[+]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
info() { echo -e "${CYAN}[*]${NC} $1"; }
err()  { echo -e "${RED}[-]${NC} $1"; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   🛡️  Hermes Cybersecurity Lab — Full Installer    ║"
echo "║   130+ tools across all security domains           ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# Fix dpkg if interrupted
dpkg --configure -a 2>/dev/null || true

# ============================================
# PHASE 1: System Dependencies
# ============================================
info "Phase 1/7: System dependencies..."
apt-get update -qq
apt-get install -y -qq \
    build-essential cmake git curl wget unzip \
    python3 python3-pip python3-venv python3-dev \
    golang-go ruby ruby-dev \
    libssl-dev libffi-dev libpcap-dev \
    pkg-config autoconf automake libtool \
    jq yq tree htop \
    2>&1 | tail -1

# ============================================
# PHASE 2: Network Recon & Scanning
# ============================================
info "Phase 2/7: Network tools..."
apt-get install -y -qq nmap masscan tcpdump tshark dnsrecon hydra john

# Modern scanners (Go)
export PATH=$PATH:/root/go/bin
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest 2>/dev/null || warn "naabu skipped"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 2>/dev/null || warn "subfinder skipped"
go install -v github.com/owasp-amass/amass/v4/...@master 2>/dev/null || warn "amass skipped"
go install -v github.com/ffuf/ffuf/v2@latest 2>/dev/null || warn "ffuf skipped"

# Bettercap
apt-get install -y -qq bettercap 2>/dev/null || warn "bettercap skipped"
log "Network tools done"

# ============================================
# PHASE 3: Exploitation Frameworks
# ============================================
info "Phase 3/7: Exploitation tools..."
apt-get install -y -qq metasploit-framework exploitdb sqlmap responder
pip3 install -q impacket crackmapexec certipy-ad bloodhound pacu xsstrike commix
gem install evil-winrm 2>/dev/null || warn "evil-winrm skipped"
log "Exploitation tools done"

# ============================================
# PHASE 4: Malware Analysis & RE
# ============================================
info "Phase 4/7: Malware analysis & RE..."
apt-get install -y -qq radare2 gdb binwalk foremost upx-ucl yara
pip3 install -q pefile oletools pdf-parser capstone unicorn pycryptodomex

# Ghidra
if ! command -v ghidraRun &>/dev/null; then
    warn "Ghidra must be installed manually from https://github.com/NationalSecurityAgency/ghidra/releases"
fi

# Cuckoo
pip3 install -q cuckoo 2>/dev/null || warn "cuckoo skipped (needs VirtualBox)"

# VT
pip3 install -q vt-py

log "Malware analysis tools done"

# ============================================
# PHASE 5: Forensics & DFIR
# ============================================
info "Phase 5/7: Forensics tools..."
pip3 install -q volatility3

# Velociraptor
if ! command -v velociraptor &>/dev/null; then
    warn "Velociraptor must be downloaded from https://github.com/Velocidex/velociraptor/releases"
fi

# Hayabusa
if ! command -v hayabusa &>/dev/null; then
    warn "Hayabusa (Windows event log forensics) must be downloaded manually"
fi

log "Forensics tools done"

# ============================================
# PHASE 6: Web, Cloud, Vuln Management
# ============================================
info "Phase 6/7: Web, cloud, and vuln tools..."

# Web
apt-get install -y -qq zaproxy nikto 2>/dev/null || warn "zap/niкto skipped"
pip3 install -q wafw00f dirsearch 2>/dev/null || true

# Cloud
pip3 install -q scoutsuite prowler kube-hunter checkov 2>/dev/null || warn "some cloud tools skipped"

# Nuclei
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest 2>/dev/null || warn "nuclei skipped"

# Trivy
apt-get install -y -qq trivy 2>/dev/null || warn "trivy skipped"

log "Web/cloud/vuln tools done"

# ============================================
# PHASE 7: CTI, OSINT, SOAR
# ============================================
info "Phase 7/7: Intelligence and automation..."
pip3 install -q spiderfoot theharvester recon-ng 2>/dev/null || warn "some OSINT tools skipped"

# Sigma
pip3 install -q sigma-cli 2>/dev/null || warn "sigma-cli skipped"

log "Intelligence tools done"

# ============================================
# Wordlists
# ============================================
info "Installing wordlists..."
if [ ! -d /usr/share/seclists ]; then
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/seclists 2>/dev/null || \
    apt-get install -y -qq seclists 2>/dev/null || \
    warn "SecLists not available — install manually"
fi

if [ ! -f /usr/share/wordlists/rockyou.txt ] && [ ! -f /usr/share/wordlists/rockyou.txt.gz ]; then
    apt-get install -y -qq wordlists 2>/dev/null || \
    warn "rockyou not available — install manually"
fi

log "Wordlists done"

# ============================================
# SUMMARY
# ============================================
echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   ✅ Hermes Cybersecurity Lab — Install Complete!  ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
echo "  📡 Network:     nmap, masscan, tcpdump, tshark, naabu, amass, subfinder, bettercap, dnsrecon, hydra, john"
echo "  ⚔️  Exploitation: metasploit, searchsploit, sqlmap, impacket, crackmapexec, certipy, bloodhound, pacu, responder, evil-winrm"
echo "  🔬 Malware/RE:  radare2, gdb, ghidra*, binwalk, foremost, upx, yara, pefile, oletools, pdf-parser, cuckoo*, vt-py"
echo "  🔍 Forensics:   volatility3, velociraptor*, hayabusa*, plaso"
echo "  🌐 Web:         zaproxy, nikto, ffuf, wafw00f, dirsearch, xsstrike, commix"
echo "  ☁️  Cloud:       scoutsuite, prowler, kube-hunter, checkov, trivy"
echo "  🛡️  Vuln Mgmt:   nuclei, nessus*"
echo "  🧠 CTI:         sigma-cli, spiderfoot, theharvester, recon-ng"
echo "  📚 Wordlists:   SecLists, rockyou"
echo ""
echo "  * requires manual installation"
echo ""
echo "  📖 See references/ for 247 categorized Hermes skills"
echo "  🔧 See references/tools-ecosystem.md for 131 tools"
echo "  📊 See references/frameworks.md for standards & frameworks"
echo ""
