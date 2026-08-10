```markdown
---
name: satellite-imagery-osint-for-physical-security
description: This skill utilizes satellite imagery OSINT to identify potential vulnerabilities in physical security measures, ideal for threat assessment and risk mitigation during reconnaissance or pre-infiltration phases. It requires access to high-resolution satellite images and analytical tools to detect anomalies.
category: security
subcategory: osint
tools_needed: Google Earth Pro, Sentinel-2 data from the European Space Agency's (ESA) Copernicus program, ArcGIS Desktop

# Satellite Imagery Osint For Physical Security

## Purpose
Satellite imagery OSINT can help identify potential vulnerabilities in physical security measures such as perimeter fences, guard patrols, and surveillance cameras. This skill is particularly useful during reconnaissance or pre-infiltration phases to gather information on the target's security posture.

## Prerequisites
- Familiarity with Google Earth Pro and ArcGIS Desktop
- Access to high-resolution satellite images from Sentinel-2 data

## Procedure

### Step 1: Acquire High-Resolution Satellite Images
Use Google Earth Pro to search for high-resolution satellite images of the target area, focusing on the region surrounding potential vulnerabilities.

```bash
gearth --maxzoom 18 --maxlevel 20
```

### Step 2: Analyze Satellite Images
Open acquired images in ArcGIS Desktop and analyze them using Sentinel-2 data. Use tools such as the NDVI (Normalized Difference Vegetation Index) to detect anomalies in vegetation patterns.

```bash
arccatalog -m "Sentinel-2 data"
```

### Step 3: Identify Potential Vulnerabilities
Use Google Earth Pro to mark potential vulnerabilities identified during image analysis, including perimeter fences, guard patrols, and surveillance cameras.

```bash
gearth --panorama --maxzoom 18 --maxlevel 20 --highlight < highlighted_areas >
```

## Expected Results
Successful execution of this skill should result in a detailed map of the target area's physical security posture, highlighting potential vulnerabilities that can inform threat assessment and risk mitigation strategies.

## Common Pitfalls
- Overlooking areas with limited satellite image coverage or vegetation masking vulnerabilities.
- Misinterpreting anomalies as natural features rather than security breaches.

## References
- European Space Agency (ESA). (2022). Sentinel-2 data. Copernicus Program.
- Google Earth Pro User Guide. (2022). Google Inc.
```