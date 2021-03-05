#!/bin/bash
if [ "$1" == "" ];
then
	echo "Uso do programa: - DIGITAR OS OCTETOS DE REDE" 
	echo "$0 192.168.15"
else
	for host in {1..254}
	do
		ping -c1 -w1 $1.$host > /dev/null 2>&1
		if [ $? -eq 0 ]
		then
			sleep 2
			echo "Host $1.$host - Responde na rede"
		fi
	done
fi
