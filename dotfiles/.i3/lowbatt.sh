#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | head -n 2 | tail -1 | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:20:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical -t 10000 -- "LOW BATTERY" "$BATTINFO"
fi
