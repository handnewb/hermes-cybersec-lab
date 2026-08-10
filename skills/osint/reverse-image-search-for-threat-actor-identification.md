---
name: reverse-image-search-for-threat-actor-identification
description: This skill uses reverse image search to identify threat actors by analyzing suspicious images or screenshots. Use this skill when analyzing incident response data, security logs, or network captures where images of malicious software, phishing emails, or compromised systems are present.
category: security
subcategory: osint
tools_needed: Google Images, Bing Image Search, File Explorer

# Reverse Image Search For Threat Actor Identification

## Purpose
Reverse image search helps identify threat actors by analyzing suspicious images or screenshots. This skill is used to analyze incident response data, security logs, or network captures where images of malicious software, phishing emails, or compromised systems are present.

## Prerequisites
- Basic knowledge of reverse image search tools and techniques.
- Familiarity with common threat actor profiles and tactics.

## Procedure

### Step 1: Search for Image on Google Images
```bash
googleimages --q "[image path or URL]" --num_results 10
```
This step uses the `googleimages` tool to perform a reverse image search on Google Images. The `--q` option specifies the image to search, and the `--num_results` option limits the number of results returned.

### Step 2: Verify Results with Bing Image Search
```bash
bing images --search "[image path or URL]" --num_results 10
```
This step uses the `bingimages` tool to perform a reverse image search on Bing Images. The `--search` option specifies the image to search, and the `--num_results` option limits the number of results returned.

## Expected Results
A list of potential threat actors or profiles that match the suspicious image or screenshot. Verify each result by researching the actor's online presence, past incidents, or known tactics.

## Common Pitfalls
- Misinterpreting image similarities as direct connections to threat actors.
- Overlooking legitimate uses of similar images or logos.

## References
- Google Images: https://images.google.com/
- Bing Image Search: https://www.bingimage-search.com/