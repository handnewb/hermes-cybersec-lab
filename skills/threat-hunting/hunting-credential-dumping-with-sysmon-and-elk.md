---
name: hunting-credential-dumping-with-sysmon-and-elk
description: This skill teaches you how to hunt for credential dumping using Sysmon and ELK tools, which is useful when investigating insider threats or lateral movement in a network. It's especially relevant during post-breach incident response efforts.
category: security
subcategory: threat-hunting
tools_needed: Sysmon, ELK (Elasticsearch, Logstash, Kibana), Windows Event Viewer

# Hunting Credential Dumping With Sysmon And Elk

## Purpose
Credential dumping is a technique used by attackers to obtain sensitive user credentials without actually needing the credentials themselves. This skill teaches you how to detect and investigate credential dumping activity using Sysmon and ELK tools.

## Prerequisites
- Basic knowledge of Windows systems and command-line interfaces.
- Familiarity with threat hunting concepts and techniques.

## Procedure

### Step 1: Enable Sysmon Event Generation for Credential Dumping Events
```bash
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sysmon\Parameters" /v Flags /t REG_DWORD /d 128
```
This sets the Sysmon event generation flag to enable it, allowing us to capture credential dumping events.

### Step 2: Configure ELK Stack for Windows Event Monitoring
```bash
# Create a new index pattern in Kibana
put _index-pattern/_default/_settings/elasticsearch/
{
  "index": {
    "number_of_shards": 1,
    "number_of_replicas": 0
  },
  "analysis": {
    "analyzer": {
      "my_analyzer": {
        "type": "keyword"
      }
    }
  }
}

# Import the Windows event schema into Logstash
cat <<EOF > /usr/share/logstash/conf/inputs/windows_event_schema.json
{
  "name": "windows_event",
  "type": "json",
  "id": "1",
  "version": 2,
  "tags": [" windows-event", "windows-credential-dumping"],
  "map": {
    "system": {
      "properties": {
        "eventID": {
          "type": "integer"
        },
        "eventType": {
          "type": "keyword"
        }
      }
    },
    "System": {
      "properties": {
        "EventID": {
          "type": "integer",
          "format": "date-time"
        },
        "EventData": {
          "type": "json"
        }
      }
    },
    "_index": {
      "type": "keyword"
    },
    "_type": {
      "type": "keyword"
    }
  }
}
EOF

# Configure Logstash to read Windows events from Event Viewer
cat <<EOF > /usr/share/logstash/conf/logstash.conf
input {
  windows_event {
    event_log => "[Windows Event Log]"
    # Path to the Event Viewer log file
    path => "C:\\Windows\\System32\\config\\Security.log"
  }
}
filter {
  json {
    source => "EventData"
  }
}
output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "%{+YYYY.MM.dd}"
  }
}
EOF

### Step 3: Analyze Credential Dumping Events
```bash
# Use the ELK stack to analyze and visualize credential dumping events
curl -XGET 'http://localhost:9200/_search?size=100'
```
This command searches for all events in the ELK index with a relevant tag and displays their contents.

## Expected Results
- Successful execution of Sysmon event generation flag.
- Successful configuration of ELK stack for Windows event monitoring.
- Displayed credential dumping events in Kibana.

## Common Pitfalls
- Incorrectly configured Sysmon event generation flag, leading to missed credential dumping events.
- ELK stack not properly indexed or visualized, resulting in poor analysis and visualization of credential dumping events.