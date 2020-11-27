#!/bin/bash
clear
if [ -f $1 ] ; then
	echo "Uso:"
	echo "$0 <URL>"
	exit
fi
echo "----------------------------------------"
echo "Identificando diretorios ou arquivos..."
echo
for dir in `cat wordlist.txt`
do
resp_dir=`curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0"  --connect-timeout 1 -s -o /dev/null -w "%{http_code}" $1/$dir/`
resp_arq=`curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" --connect-timeout 1 -s -o /dev/null -w "%{http_code}" $1/$dir`
if [ $resp_dir -eq 200 ] ; then
	echo "Diretorio encontrado: $dir"

elif [ $resp_arq -eq 200 ] ; then
	echo "Arquivo encontrado: $dir"
fi
done
echo
echo "---------------------------------------"
echo "Listando subdominios do ALVO..."
echo
for subd in `cat wordlist.txt`
do
	resp=`host $subd.$1 `
	if [ $? -eq 0 ] ; then
		host $subd.$1 | egrep "$subd|address" 
	fi
done

echo 
echo "-------------------------------------"
echo "Localizando entradas DNS na rede do ALVO..."
echo
host=`host $1| head -1| cut -d " " -f4`
iprange=`whois $host | egrep 'inetrev|CIDR' | tr -d [a-z][A-Z:" "] | cut -d "." -f1,2,3 |cut -d " " -f1| head -1`
for ip in `seq 1 254`
do
	host $iprange.$ip  | egrep -vi  "not found|$iprange|locaweb"
done

echo 
echo "-------------------------------------"
echo "Identificando vulnerabilidade de transferencia de ZONA no ALVO..."
for zone in `host -t ns $1| cut -d " " -f4`
do
	host -l $1 $zone
done
