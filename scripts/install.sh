#!/bin/bash
# Hermes Cybersecurity Lab — One-Shot Installer
# Run: bash scripts/install.sh

set -e

echo "🛡️  Hermes Cybersecurity Lab — Installing tools..."

# Fix dpkg if interrupted
dpkg --configure -a 2>/dev/null || true

# Network tools
echo "📡 Network tools..."
apt-get install -y -qq nmap tcpdump netcat-openbsd masscan

# Forensics
echo "🔬 Forensics..."
apt-get install -y -qq binwalk foremost
pip3 install -q volatility3

# Analysis / Reverse Engineering
echo "🔧 Analysis..."
apt-get install -y -qq radare2 gdb

# Web / API
echo "🌐 Web/API..."
apt-get install -y -qq sqlmap ffuf

# Python stack
echo "🐍 Python tools..."
pip3 install -q scapy impacket pwntools pycryptodomex

# Wordlists
echo "📚 Wordlists..."
if [ ! -d /usr/share/seclists ]; then
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/seclists 2>/dev/null || \
    apt-get install -y -qq seclists
fi
if [ ! -f /usr/share/wordlists/rockyou.txt.gz ] && [ ! -f /usr/share/wordlists/rockyou.txt ]; then
    apt-get install -y -qq wordlists 2>/dev/null || echo "⚠️  rockyou not available — install manually"
fi

# Nuclei (Go required)
echo "⚡ Nuclei..."
if command -v go &>/dev/null; then
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest 2>/dev/null || echo "⚠️  nuclei install failed — check Go version"
else
    echo "⚠️  Go not installed — skipping nuclei"
fi

echo ""
echo "✅ Hermes Cybersecurity Lab — install complete!"
echo ""
echo "Tools installed: nmap, tcpdump, netcat, masscan, binwalk, foremost,"
echo "                 volatility3, radare2, gdb, sqlmap, ffuf, nuclei"
echo "Python:          scapy, impacket, pwntools, pycryptodomex"
echo "Wordlists:       SecLists + rockyou"
