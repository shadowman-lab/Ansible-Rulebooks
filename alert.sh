#!/bin/bash

# Must be run by vpxd user, I placed mine in /home/eda.sh

# chown vpxd:cis /home/eda.sh && chmod +x /home/eda.sh

# you can test to make sure the script runs su -s /bin/bash -c "/home/eda.sh" vpxd

# This includes all possible Environment variables from https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere/8-0/alarm-environment-variables-for-scripts.html

# Not all variables will be populated for every alarm, it depends on the type of alarm and what triggered it

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
            \"alarm_target\": \"$VMWARE_ALARM_TARGET_NAME\",
            \"alarm_target_id\": \"$VMWARE_ALARM_TARGET_ID\",
            \"alarm_value\": \"$VMWARE_ALARM_ALARMVALUE\",
            \"alarm_oldstatus\": \"$VMWARE_ALARM_OLDSTATUS\",
            \"alarm_status\": \"$VMWARE_ALARM_NEWSTATUS\",
            \"alarm_name\": \"$VMWARE_ALARM_NAME\",
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
            \"event_description\": \"$VMWARE_ALARM_EVENTDESCRIPTION\"
          }
        }"
