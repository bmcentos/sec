#!/bin/bash

read -p "Digite a porta local: " lport
read -p "Digite a porta que ficara disponivel externamente: " rport
read -p "Digite a porta do serviço remoto: " sport
read -p "Digite o ip local: (127.0.0.1) " lhost
read -p "Digite o ip externo do host local: " rhost

echo "socat TCP4:$rhost:$rport TCP4:$lhost:$sport" > socat-remote.sh

echo "Usar o script socat-remote.sh no host remoto"

socat TCP4-LISTEN:$rport,reuseaddr,fork TCP4-LISTEN:$lport,reuseaddr

