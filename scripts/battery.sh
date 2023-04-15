#!/bin/bash
   while true
    do
       export DISPLAY=:0.0
       battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
       if on_ac_power; then
           if [ $battery_level -ge 95 ]; then
              notify-send "Battery Full" "Level: ${battery_level}% "
           fi
       else
           if [ $battery_level -le 20 ]; then
              notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
           fi
       fi
     sleep 60
done
