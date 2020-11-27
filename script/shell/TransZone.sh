#!/bin/bash

for zone in `host -t ns $1| cut -d " " -f4`
do
	host -l $1 $zone
done
