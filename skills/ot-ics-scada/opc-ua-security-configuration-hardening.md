---
name: opc-ua-security-configuration-hardening
description: This skill enables advanced security configurations for OPC UA systems in OT-ICS-SCADA environments, focusing on securing data access, encryption, and authentication. It is ideal to use this skill when implementing or upgrading OPC UA systems with a focus on security.
category: security
subcategory: ot-ics-scada
tools_needed: OPC UA Client Library, Node-RED, UAC (Unified Access Control), OpenSSL

# OPC UA Security Configuration Hardening

## Purpose
OPC UA systems in OT-ICS-SCADA environments are prone to vulnerabilities such as data tampering, unauthorized access, and unencrypted communication. This skill addresses these security issues by implementing robust security configurations, including encryption, authentication, and authorization.

## Prerequisites
- Basic knowledge of OPC UA fundamentals and UAC.
- Experience with Node-RED for automation.

## Procedure

### Step 1: Configure Unified Access Control (UAC) Policy
```bash
node-red-contrib-uac-config --policy myuacpolicy --port 5654
```
This step sets up the UAC policy, which controls access to OPC UA resources. The `--policy` option specifies the name of the policy (`myuacpolicy`), and `--port` specifies the port number (in this case, 5654).

### Step 2: Enable Transport Layer Security (TLS) for Encryption
```bash
opcua-client --tlsopt -cert /path/to/client-cert.pem -key /path/to/client-key.pem -ca /path/to/ca-cert.pem
```
This step enables TLS encryption for the OPC UA communication. Replace `/path/to/` with actual file paths to your client certificate, private key, and CA certificate.

### Step 3: Configure Authentication Using Certificates
```bash
node-red-contrib-uac-auth-config --cert /path/to/server-cert.pem -key /path/to/server-key.pem
```
This step configures authentication using certificates for the OPC UA server. Replace `/path/to/` with actual file paths to your server certificate and private key.

## Expected Results
The system should now be secure, with encrypted communication, authenticated access, and authorized access control.

## Common Pitfalls
- Forgetting to replace placeholder paths with actual file locations.
- Failing to regularly update certificates for secure communication.