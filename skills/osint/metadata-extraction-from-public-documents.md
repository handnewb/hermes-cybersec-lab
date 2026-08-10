---
name: metadata-extraction-from-public-documents
description: This skill enables extraction of metadata from publicly available documents, such as PDFs or Word files, to gather information about the document's origin, authorship, and potential security risks. It is particularly useful when conducting Open-Source Intelligence (OSINT) operations where metadata can provide valuable context.
category: security
subcategory: osint
tools_needed: pdf-parser, python

# Metadata Extraction From Public Documents

## Purpose
Metadata extraction from public documents is crucial in OSINT to identify potential security risks, track authorship, and understand the origin of sensitive information. By analyzing metadata, investigators can gain insights into the document's creation, dissemination, and reception.

## Prerequisites
- Familiarity with command-line interfaces (CLI) and Python programming language.
- A PDF parsing library such as pdf-parser installed on your system.

## Procedure

### Step 1: Extract Metadata Using pdf-parser
```bash
pdf-parser --get-metadata file.pdf
```
This step extracts metadata from the specified PDF file, including creation date, author, and keywords.

### Step 2: Analyze Metadata with Python
```python
import json
with open('metadata.json') as f:
    metadata = json.load(f)
print(metadata['creationDate'])
print(metadata['author'])
```
This step reads and parses the extracted metadata in JSON format using the `json` module, allowing for more detailed analysis of the document's properties.

## Expected Results
- A well-formatted JSON object containing metadata about the document.
- The creation date, author, and keywords extracted from the PDF file.

## Common Pitfalls
- Incorrectly assuming that all public documents contain metadata.
- Failing to account for potential encryption or obfuscation of metadata in certain files.

## References
- https://github.com/medialabs/pdf-parser
- https://docs.python.org/3/library/json.html