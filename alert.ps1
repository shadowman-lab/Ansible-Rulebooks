$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")

$body = "{`"vmware_alert`": {`n `"title`": `"vCenter Alarm`",
`n `"target`": `"$env:VMWARE_ALARM_TARGET_NAME`",
`n `"value`": `"$env:VMWARE_ALARM_ALARMVALUE`",
`n `"status`": `"$env:VMWARE_ALARM_NEWSTATUS`",`n `"alarm`": `"$env:VMWARE_ALARM_NAME`",
`n `"description`": `"$env:VMWARE_ALARM_EVENTDESCRIPTION`"`n }`n}"

$response = Invoke-RestMethod 'http://eda.shadowman.dev:5000/endpoint' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json
