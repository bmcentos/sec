#!/bin/bash
clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
reset=`tput sgr0`
echo -e "$RED###################"
echo -e "#    MD5 Find     #"
echo -e "###################$reset"
echo 
read -p "Digite o hash MD5: " hash
res=`grep -i $hash lista-md5.txt | cut -d ":" -f1 | wc -l`
pass=`grep -i $hash lista-md5.txt | cut -d ":" -f1`
if [ $res -eq 0 ] ; then
	echo -e "\n$RED[-] Senha nao encontrada\n"
else
	echo -e  "\n$GREEN [+] Senha encontrada: $RED $pass\n"
fi
