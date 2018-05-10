#!/bin/bash
#
# Syntax:
# iget url filename i
# Where filename = a file name
# Where i = the interval of the download in seconds

url=$1
filename=$2

wget $url -O $(date '+%Y-%m-%d_%H%M%S')_$filename

