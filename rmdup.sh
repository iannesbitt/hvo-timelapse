#!/bin/bash

cksum * | sort -n > filelist
old=""

while read sum lines filename
  do
    if [[ "$sum" != "$old" ]]; then old="$sum"
      continue
    fi
  rm -f "$filename"
done < filelist
