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
            \"value\": \"$VMWARE_ALARM_ALARMVALUE\",
            \"status\": \"$VMWARE_ALARM_NEWSTATUS\",
            \"alarm\": \"$VMWARE_ALARM_NAME\",
            \"description\": \"$VMWARE_ALARM_EVENTDESCRIPTION\"
          }
        }"
