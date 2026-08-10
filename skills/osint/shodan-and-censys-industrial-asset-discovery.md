---
name: shodan-and-censys-industrial-asset-discovery
description: This skill enables industrial asset discovery by utilizing Shodan and Censys to identify exposed IoT devices, networks, and assets, helping to identify potential vulnerabilities in industrial control systems. It's particularly useful for incident responders, security analysts, and researchers tasked with identifying and remediating industrial IoT (IIoT) threats.
category: security
subcategory: osint
tools_needed: Shodan API Key, Censys Token

# Shodan And Censys Industrial Asset Discovery

## Purpose
Industrial asset discovery is critical to identify exposed IoT devices, networks, and assets that could potentially be compromised by attackers. This skill helps incident responders, security analysts, and researchers identify potential vulnerabilities in industrial control systems.

## Prerequisites
- Familiarity with Shodan and Censys APIs
- Basic knowledge of Linux/Windows command-line interfaces

## Procedure

### Step 1: Search for Exposed IoT Devices Using Shodan
```bash
shodan search "iot device" --limit 1000 -api-key $SHODAN_API_KEY
```
This step retrieves a list of exposed IoT devices that are accessible over the internet.

### Step 2: Search for Network and Asset Exposure Using Censys
```bash
censys search "network" --limit 1000 -token $CENSYS_TOKEN
```
This step identifies exposed networks and assets that could potentially be targeted by attackers.

## Expected Results
A list of exposed IoT devices, networks, and assets should be retrieved.

## Common Pitfalls
- Not properly validating API keys and tokens
- Insufficient knowledge of Shodan and Censys search syntax

## References
- https://www.shodan.io/docs/api
- https://censys.io/