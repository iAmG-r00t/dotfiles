#!/bin/bash
# by th3gr00t
# status bar script for i3 to check bluetooth headset connections.
bluetootheadset=`hcitool con | grep -o -P '(?<=ACL).*(?=handle)'`
#name=$(xargs hcitool name $bluetootheadset)

if [ -z $bluetootheadset ]
 then
   echo "No Bluetooth Headset Connected"
 else
  name=$(hcitool name $bluetootheadset)
  echo -e "${name} Headset Connected"
 fi
