#!/usr/bin/python3

import requests
import os

#Limpando terminal
os.system('cls' if os.name == 'nt' else 'clear')
#Informe a url da lista que quer usar
filename="lista.txt"
lista = "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt"
lista = requests.get(lista)
lista = open(filename,"wb").write(lista.content)

#Definindo variaveis
url="https://worksn.com.br/"
paths = open(filename,'r')

#Valida quantidade de linhas da wordlist
with open(filename, 'r') as len_file:
    count = 0
    for line in len_file:
        if line != "\n":
          count += 1

print("[!!] NUMERO DE TESTES: " + str(count))
print("[!!] INICIANDO CHECAGEM NA URL - " + url)

for path in open(filename, 'r').readlines():
    path = path.replace('\n','')
    uri=url + path
    request = requests.get(uri)
    code = request.status_code
    tamanho_request = len(request.text)
    #Checa se o retorno da resposta é 200 e se o tamanho da resposta é maior que 0
    if (("200" in str(code)) and (tamanho_request != 0)):
      print(" [+] - ENCONTRADO - " + uri )

