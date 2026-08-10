---
name: dark-web-intelligence-gathering-methodology
description: This skill enables users to gather intelligence from the dark web, a part of the deep web that requires special access, often through Tor browsers or other anonymizing tools, to uncover valuable information about malicious actors, their operations, and techniques. It is particularly useful in threat intelligence gathering for cybersecurity professionals.
category: security
subcategory: osint
tools_needed: Tor Browser, Onion Sink, Maltego

# Dark Web Intelligence Gathering Methodology

## Purpose
The primary goal of this skill is to empower cybersecurity professionals to gather intelligence from the dark web, which can be used to identify potential threats, understand adversary tactics, techniques, and procedures (TTPs), and inform security strategies. This skill is particularly useful for those involved in threat hunting, incident response, or security operations centers.

## Prerequisites
- Basic knowledge of Tor Browser functionality
- Familiarity with using onion sink to track IP addresses

## Procedure

### Step 1: Configure Onion Sink
```bash
# Install onion sink if not already installed
sudo apt update && sudo apt install onion-sink
```
Configure onion sink to track IP addresses by adding the following lines to your Tor browser's configuration file (`~/.tor-browser/config`):
```conf
# Enable the IP address tracker
ip-tracker-enabled true

# Specify the number of hops for tracking (1-5)
ip-tracker-hops 3
```
Restart the Tor Browser to apply the changes.

### Step 2: Use Maltego to Map Dark Web Connections
```bash
# Install Maltego if not already installed
pip install maltego
```
Open Maltego and create a new project. Then, use the Onion Sink tool to map dark web connections:
```bash
# Open Tor Browser with onion sink enabled
tor-browser --config-file=~/.tor-browser/config

# Use Maltego's Onion Sink tool to map IP addresses
maltego -t onion-sink <IP ADDRESS>
```
This will display a visual representation of the dark web connection.

## Expected Results
- The ability to track and map IP addresses using onion sink.
- A clear understanding of how to use Maltego for network visualization.

## Common Pitfalls
- Incorrectly configuring onion sink, leading to IP address tracking issues.
- Failure to restart Tor Browser after configuration changes.

## References
- [Tor Project Documentation](https://www.torproject.org/docs/tor-browser-config.html)
- [Maltego User Guide](https://docs.maltego.com/userguide/)