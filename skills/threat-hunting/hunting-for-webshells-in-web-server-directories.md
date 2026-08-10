---
name: hunting-for-webshells-in-web-server-directories
description: This skill is used to hunt for webshells in web server directories, which are often exploited by attackers to gain unauthorized access to a system. It's typically employed when analyzing the output of directory traversal or searching for suspicious files on a web server.
category: security
subcategory: threat-hunting
tools_needed: dirb, grep, zip2john

# Hunting For Webshells In Web Server Directories

## Purpose
Web servers are frequently targeted by attackers who attempt to exploit vulnerabilities in the application code or misconfigured directories. This skill addresses the security problem of identifying webshells, which can be used as a pivot point for further attacks.

## Prerequisites
- Basic knowledge of Linux commands and directory traversal exploits.
- Familiarity with the output format of tools like dirb.

## Procedure

### Step 1: Identify Potential Webshell Files
```bash
dirb -r -x /var/www/html, /var/www, /var/www/htdocs > potential_webshells.txt
```
This command uses dirb to perform a directory traversal on the given directories and outputs the results to a file named `potential_webshells.txt`. The `-r` flag indicates that the command should run recursively, and the `-x` flag specifies the directories to scan.

### Step 2: Filter Out Non-Exploitable Files
```bash
grep -v "\.(jpg|gif|css|js)$" potential_webshells.txt > filtered_webshells.txt
```
This command uses grep to filter out files that are not webshell-like, such as image or CSS files. The `-v` flag inverts the match, so `grep` will select only lines that do not contain the specified patterns.

### Step 3: Check for Zip Archives (Webshells)
```bash
zip2john filtered_webshells.txt -p | john --wordlist=wordlist.lst
```
This command uses zip2john to crack the password of any zip archives found in the `filtered_webshells.txt` file, and then uses John the Ripper with a pre-sorted wordlist (`wordlist.lst`) to guess the password.

## Expected Results
A list of potential webshell files with their corresponding passwords should be generated. This can be used as input for further analysis or exploit development.

## Common Pitfalls
- Be cautious when analyzing output from directory traversal tools, as false positives may occur.
- Make sure to use a secure wordlist when cracking zip archive passwords with John the Ripper.

## References
- OWASP Directory Traversal Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/Directory_Traversal_Cheat_Sheet.html
- Zip2john documentation: http://www.vupac.com/john/zip2john.htm