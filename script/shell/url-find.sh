#!/bin/bash
#Localiza subdominios atrelado a determinado dominio
if [ "$1" == "" ] ; then
	echo "DIGITE O DOMINIO A SER LOCALIZADO"
	echo "$0 dominioalvo.com.br"
	exit 1
fi
echo "URLs mapeadas no dominio"
index=`wget $1 2>&1 /dev/null| grep Salvando| cut -d ":" -f2| tr -d [”,“," "]`

read -p "Deseja visualizar as URLs mapeadas? --Digite \"sim\" para exibir ou qualquer outra coisa para continuar" url
if [ $url == "sim" ] ; then
cat $index | grep href | cut -d ":" -f2| cut -d "\"" -f1| grep ^/ | sed 's/\/\///g'
else
	echo "Ok"
fi

echo "---"
echo "Subdominios efetivos"
cat $index | grep href | cut -d ":" -f2| cut -d "\"" -f1| grep ^/ | sed 's/\/\///g' | cut -d "/" -f1| sort | uniq
echo
echo "IP dos subdominios"
for host in `cat $index | grep href | cut -d ":" -f2| cut -d "\"" -f1| grep ^/ | sed 's/\/\///g'| cut -d "/" -f1 | sort | uniq | egrep -v 'youtube|twit|facebook|instagram|tiktok'`
do 
	host $host
done
rm -rf $index
