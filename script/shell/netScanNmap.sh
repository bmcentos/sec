#!/bin/bash
if [ -z $1 ] ; then
	echo "Uso:"
	echo "$0 <REDE>"
	echo "EX: $0 192.168.0"
	exit
fi
for ip in `seq 1 255`
do
	nmap=`nmap -sn $1.$ip | grep -i "Host is up" |wc -l`
	if [ $nmap -eq 1 ] ; then
		echo "$1.$ip - HOST UP"
	fi
done
