#!/bin/bash

# script that starts a timer, data will be saved on a file and we will able to read our battery duration in seconds
echo 'Starting timer';

timeout=0
batteryPercentagePath=`cat /sys/class/power_supply/BAT0/capacity`
while [ $batteryPercentagePath -gt 1 ]
do
	#batteryPercentagePath, file that has the actual battery percentage
	batteryPercentagePath=`cat /sys/class/power_supply/BAT0/capacity`
	#dateFormat, actual date
	dateFormat=`date "+%H:%M:%S"`

	sleep 1
	timeout=$(($timeout + 1))
	echo "$dateFormat;$timeout;$batteryPercentagePath;" >> log.txt
done

