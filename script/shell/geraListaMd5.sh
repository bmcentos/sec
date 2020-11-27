#!/bin/bash
#Cria uma lista md5 local baseada em wordlist, para quebra de hash MD5
for i in `cat lista.txt`
do
echo -n "$i:" && echo -n $i | md5sum  | cut -d " " -f1 
done > lista-md5.txt && wc -l lista-md5.txt
