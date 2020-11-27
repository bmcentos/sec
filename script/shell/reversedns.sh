#!/bin/bash
if [ -f $1 ] ; then
	echo "Uso:"
	echo "$0 <Dominio Alvo>"
	exit
fi
host=`host $1| head -1| cut -d " " -f4`
iprange=`whois $host | egrep 'inetrev|CIDR' | tr -d [a-z][A-Z:" "] | cut -d "." -f1,2,3 |cut -d " " -f1| head -1`
for ip in `seq 1 254`
do
	host $iprange.$ip  | egrep -vi  "not found|$iprange"
done
