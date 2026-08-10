```markdown
---
name: xml-external-entity-(xxe)-injection-to-file-disclosure
description: This skill is used to identify web applications vulnerable to XML external entity (XXE) injection attacks that can lead to file disclosure. It helps security testers understand how attackers could exploit XXE vulnerabilities in the application's configuration and properly secure it.
category: security
subcategory: web-app-security
tools_needed: Burp Suite, SoapUI

# Xml External Entity (Xxe) Injection To File Disclosure

## Purpose
XML external entity injection attacks allow an attacker to execute system commands on a vulnerable server. This skill is used to test the vulnerability of web applications and identify any XXE injection in XML files which can be used to disclose sensitive information.

## Prerequisites
- Knowledge of how to use Burp Suite or SoapUI for testing web applications.
- Familiarity with how XML external entities work.

## Procedure

### Step 1: Identify Potential XXE Injection Points
```bash
burp_inject --target http://example.com --data '<%s>' 'x'
```
This command injects an XXE attack into the target URL to test if it is vulnerable. The `<%s>` placeholder represents where you would typically put user input.

### Step 2: Verify the Vulnerability
```bash
soapui -u http://example.com -d '<%s>' 'x'
```
If the application is vulnerable, this command will trigger an error or execute a system command on the server.

## Expected Results
- The application responds with an error message indicating it's vulnerable to XXE attacks.
- The application executes a system command and discloses sensitive information in a file.

## Common Pitfalls
- Not properly sanitizing user input before passing it to XML files.
- Ignoring or downplaying the potential for XXE injection vulnerabilities.
- Failing to apply patches for known XXE vulnerability fixes.

## References
- OWASP: [XML External Entities (XXE)](https://cheatsheetseries.owasp.org/cheatsheets/XML_External_Entities_(XXE)_Cheatsheet.html)
```