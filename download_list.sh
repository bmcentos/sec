#!/bin/bash

echo "[!!] Selecione uma lista para fazer o download:"
curl -s https://github.com/danielmiessler/SecLists/tree/master/Discovery/Web-Content| grep .txt| cut -d ">" -f2| cut -d "<" -f1| egrep -v "^ *$"| grep -v " "
echo
read -p "[?] Qual lista voce quer baixar? " resp
function wfuzz() {
        echo "[!!] Utilize o WFUZZ para testar a lista"
        echo " wfuzz  -z file,$resp --hl 0 https://URL/FUZZ"
}

url="https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/$resp"
if [ `curl -s -w %{http_code} $url | tail -1` -eq 200 ]
  then
    if [ -e $resp* ]
      then
        echo "[!!] Lista ja existe"
        ls -1 $resp*
        wfuzz
        exit 0
    fi
    echo "[+] Fazendo o download da lista..."
    wget $url
    wfuzz
  else
    echo "[-] Falha em baixar a lista"
    exit 1
fi
