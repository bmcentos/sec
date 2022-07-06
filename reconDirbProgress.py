#!/usr/bin/python3

import requests
import os
from alive_progress import alive_bar

#Limpando terminal
os.system('cls' if os.name == 'nt' else 'clear')
#Informe a url da lista que quer usar
filename="lista.txt"
lista = "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt"
lista = requests.get(lista)
len_lista = open(filename,"wb").write(lista.content) #Quantidade de linhas do arquivo

print(lista)
#Definindo variaveis
url="https://worksn.com.br/"
paths = open(filename,'r')

with open(filename, 'r') as len_file:
    count = 0
    for line in len_file:
        if line != "\n":
          count += 1
print("[!!] TESTES A SEREM REALIZADOS: " + str(count))
print("[!!] INICIANDO CHECAGEM NA URL - " + url)

#Iniciando teste
with alive_bar(len_lista, force_tty=True) as bar:
    for line in paths.readlines():
        line=line.replace('\n','')
        uri=url + line
        request = requests.get(uri)
        code = request.status_code
        tamanho_request = len(request.text)
        #Checa se o retorno da resposta é 200 e se o tamanho da resposta é maior que 0
        if (("200" in str(code)) and (tamanho_request != 0)):
          print(" [+] - ENCONTRADO - " + uri )
        bar()
    print("FIM")

