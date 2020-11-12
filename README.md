# Background

If you have a Unix app you want to perform pre/post tasks on while performing backup you can use this script. The only requirements are:

1)  Actifio Connector must be installed on the host
2)  App must be discovered
3)  The sh file in this repo must be renamed to match the Appliance Application ID, so if the appid is 1566877, then the sh file should be named appid.1566877.sh   
You can use the Appliance CLI command reportapps to display App IDs.
4)  The renamed sh file should be in /act/scripts

Effectively the order of events will be:

1)  Actifio requests the Connector to run the init tasks
2)  Actifio requests the Connector to run the freeze tasks
3)  Actifio requests the Connector to run the thaw tasks
4)  Actifio requests the Connector to run the fini tasks


# Error handling

The script uses simple error code checking to determine if the exit is clean or dirty.   


# Renaming the script

The script is called appid.xxxx.sh by default.   You must learn the Appliance Application ID of the app and then rename it.   If the Appliance Application ID is 1566877 then the file name should be appid.1566877.sh
You can use the Appliance CLI command reportapps to display App IDs.   

# Installing the Script

Once the script is customized and named corrctly place it in the following location:
```
/act/scripts
```
Make sure the file is executable:

`chmod 755 appid.xxxx.sh`

# Testing the Scripts

Open a shell and run these commands:
```
/act/scripts/appid.1566877.sh init
/act/scripts/appid.1566877.sh freeze
/act/scripts/appid.1566877.sh thaw
/act/scripts/appid.1566877.sh fini
```

### Event logging
The script is written so when run manually, all output is echoed to the screen.   When run by the Actifio Connector all output will be logged in the UDSAgent.log file that can be found in /var/act/log/UDSAgent.log
This means if you are debugging events, use this log file.
