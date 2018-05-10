#!/bin/bash
# iget.sh
#
#  Author: Gregory Strike
#     URL: //www.gregorystrike.com/2007/06/06/bash-script-interval-get/
#
# Purpose: This script downloads a file from the Internet at a set interval.
#
#
# Syntax:
# iget url filename i
# Where filename = The custom file name
# Where i = the interval of the download in seconds
REQPARAMS=3
url=$1
filename=$2
interval=$3
function download()
{
	#http://www.wluk.com/lambeaucam/lambeaucam.jpg
	wget $url -O $(date '+%Y-%m-%d_%H%M%S')_$filename
}
function pause()
{
	echo Downloading $url...
	echo Interval is set to $interval seconds...
	echo -n "Next download in "
	(( intervalleft=interval ))
	while (( intervalleft > 0 ))
	do
		echo -n -e "$intervalleft seconds..."
		if ((${intervalleft:${#intervalleft}-1:1}==9))#Detects if there is a nine at the end
			then
			echo -n -e " \\b"			#If so, write a space and then backspace
		fi
		sleep 1						#Zzzzzz...  For 1 second.
		echo -n -e \\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b	#Erases the "seconds..."
		backspaces=${#intervalleft}			#Get the current number of digits
		while (( backspaces > 0 ))			#Loop until the last digit has been backspaced
		do
			echo -n -e \\b
			(( backspaces-- ))
		done
		(( intervalleft-- ))
	done
}
if (( $# != $REQPARAMS ))
	then
		echo "Error: Incorrect Syntax"
		echo "Required: " $REQPARAMS " Passed: " $#
		echo
		echo "Syntax: ./iget.sh url filename interval"
		echo "URL = The URL/location of the file."
		echo "FILENAME = Base name of the file saved locally."
		echo "INTERVAL = The seconds between downloads."
	exit
fi
while ((1))
do
	download
	pause
done
