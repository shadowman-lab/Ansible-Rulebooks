#!/bin/bash

# Must be run by vpxd user, I placed mine in /home/eda.sh

# chown vpxd:cis /home/eda.sh && chmod +x /home/eda.sh

# you can test to make sure the script runs su -s /bin/bash -c "/home/eda.sh" vpxd

# Define the API endpoint and Token
URL="YOUREVENTSTREAMURL"
TOKEN="YOURTOKEN"

# Execute the POST request directly
/usr/bin/curl -s -X POST "$URL" \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d "{
          \"vmware_alert\": {
            \"title\": \"vCenter Alarm\",
            \"target\": \"$VMWARE_ALARM_TARGET_NAME\",
            \"target_id\": \"$VMWARE_ALARM_TARGET_ID\",
            \"value\": \"$VMWARE_ALARM_ALARMVALUE\",
            \"oldstatus\": \"$VMWARE_ALARM_OLDSTATUS\",
            \"status\": \"$VMWARE_ALARM_NEWSTATUS\",
            \"alarm\": \"$VMWARE_ALARM_NAME\",
            \"alarm_id\": \"$VMWARE_ALARM_ID\",
            \"event_username\": \"$VMWARE_ALARM_EVENT_USERNAME\",
            \"event_datacenter\": \"$VMWARE_ALARM_EVENT_DATACENTER\",
            \"event_computersource\": \"$VMWARE_ALARM_EVENT_COMPUTERSOURCE\",
            \"event_host\": \"$VMWARE_ALARM_EVENT_HOST\",
            \"event_vm\": \"$VMWARE_ALARM_EVENT_VM\",
            \"event_network\": \"$VMWARE_ALARM_EVENT_NETWORK\",
            \"event_datastore\": \"$VMWARE_ALARM_EVENT_DATASTORE\",
            \"event_dvs\": \"$VMWARE_ALARM_EVENT_DVS\",
            \"triggering_summary\": \"$VMWARE_ALARM_TRIGGERINGSUMMARY\",
            \"declaring_summary\": \"$VMWARE_ALARM_DECLARINGSUMMARY\",
            \"description\": \"$VMWARE_ALARM_EVENTDESCRIPTION\"
          }
        }"
