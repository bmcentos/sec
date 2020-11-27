#!/bin/bash
if [ -z $1 ] ; then
	echo "Uso:"
	echo "$0 <REDE>"
	echo "EX: $0 192.168.0"
	exit
fi
for ip in `seq 1 255`
do
	ping -W 0,3 -c1 $1.$ip 2> /dev/null >$1
	if [ $? -eq 0 ] ; then
		echo "$1.$ip - HOST UP"
	fi
done
