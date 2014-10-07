#!/bin/bash

# Check if we are the active node
#  DEVICE must be up and have an IP address assigned
DEVICE="eth0:0"

# Splunk home
SPLUNK_HOME="/opt/splunk"

# Secondary node
SECONDARY_NODE="192.168.1.1"


lines="`/sbin/ifconfig $DEVICE | grep inet | wc -l`"

if [ $lines == "0" ]
then
        # We are not the active node
        # Exit gracefully
        exit
fi

# Else, we are the active node
# Rsync SPLUNK_HOME to the other node
/usr/bin/rsync -az $SPLUNK_HOME/ splunk@$SECONDARY_NODE:$SPLUNK_HOME/
