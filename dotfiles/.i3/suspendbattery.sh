#!/bin/sh
#If you have more than one battery use the one below to grep battery name
#acpi -b | grep "Battery 0" | awk -F'[,:%]' '{print $2, $3}'
#acpi -b use this to find battery name

status=`acpi -b | awk -F'[,:%]' '{print $2}'`
capacity=`acpi -b | awk -F'[,:%]' '{print $3}'`

if [ $status = Discharging -a $capacity -lt 5 ]
 then
 notify-send -u critical -t 10000 -- 'Battery is in critical condition suspending the laptop in 10 seconds there is no going back!!'
 sleep 10
 systemctl suspend
fi
