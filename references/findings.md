# Findings Log

## Template
```
### YYYY-MM-DD — Title
- **Target/Scope:** 
- **Tool(s):** 
- **Finding:** 
- **Severity:** Critical / High / Medium / Low / Info
- **Evidence:** 
- **Remediation:** 
- **Status:** Open / Fixed / Accepted Risk
```

---

### 2026-08-07 — Initial Localhost Security Audit
- **Target/Scope:** NT-OP-ES (localhost), enumeration only
- **Tool(s):** netstat, curl, PowerShell (Get-MpComputerStatus)
- **Finding:** 6 findings — 0 Critical, 2 High, 2 Medium, 1 Low, 1 Info
- **Evidence:** Listed below

---
**High — Windows Defender Disabled**
- AntivirusEnabled: False, RealTimeProtectionEnabled: False
- No active endpoint protection detected
- Remediation: Enable Defender via `Set-MpPreference -DisableRealtimeMonitoring $false`

**High — PostgreSQL bound to 0.0.0.0:5432**
- Database exposed on all interfaces
- psql not locally available to test authentication
- Remediation: Bind to 127.0.0.1 only in postgresql.conf, or firewall restrict

**Medium — RDP exposed on 0.0.0.0:3389**
- Remote Desktop accessible network-wide
- NLA status unverified
- Remediation: Restrict via Windows Firewall to trusted subnets

**Medium — VNC on 0.0.0.0:5900**
- Unencrypted remote access protocol
- Authentication strength unknown
- Remediation: Tunnel via SSH or replace with RDP+NLA

**Low — SSH on 0.0.0.0:22**
- Likely Tailscale SSH — acceptable
- Confirm key-only auth, no password login
- Remediation: Verify sshd_config: PermitRootLogin no, PasswordAuthentication no

**Info — Ports 6000, 7680, 9796 unidentified**
- Port 6000: unknown service, needs investigation
- Port 7680: likely Windows Update Delivery Optimization
- Port 9796: unknown service
- Remediation: Identify services, close if unnecessary

---
- **Status:** Open

### 2026-08-07 — Remediation Complete
- **Target/Scope:** NT-OP-ES, PostgreSQL + firewall hardening
- **Tool(s):** New-NetFirewallRule, postgresql.conf, pg_ctl
- **Finding:** 2-layer defense applied. Port conflict discovered.

**PostgreSQL (PID 7232, C:\Program Files\PostgreSQL\18):** FIXED
- `listen_addresses = '*'` → `'localhost'` ✅
- Windows Firewall: Block all remote inbound TCP 5432 ✅
- Service won't restart — port 5432 occupied by embedded instance (PID 27620, .pg0). Config will apply on next successful start.
- 0.0.0.0 bind eliminated ✅

**Embedded PostgreSQL (PID 27620, .pg0\18.1.0):**
- Already localhost-only. No action needed.

**Defender:** 0x800106BA — grupo de política ou outro AV. Precisa de investigação manual.

- **Status:** PostgreSQL ✅ FIXED | Defender ⚠️ PENDING
