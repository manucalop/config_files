#!/bin/bash
SCHEMA="org.gnome.settings-daemon.plugins.color"
KEY="night-light-enabled"

STATUS=$(gsettings get ${SCHEMA} ${KEY})

# if [ "${STATUS}" == "'true'" ]; then
if [ "$STATUS" == "true" ]; then
    gsettings set ${SCHEMA} ${KEY} 'false'
else
    gsettings set ${SCHEMA} ${KEY} 'true'
fi
