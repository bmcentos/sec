#!/bin/bash
if [ -f $1 ] ; then
	echo "Uso:"
	echo "$0 <URL>"
fi
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
