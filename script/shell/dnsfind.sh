#!/bin/bash
for subd in `cat wordlist.txt`
do
	resp=`host $subd.$1 `
	if [ $? -eq 0 ] ; then
		host $subd.$1 | egrep "$subd|address" 
	fi
done

