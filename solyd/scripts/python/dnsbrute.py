#!/usr/bin/python
import dns.resolver
import sys

#Passando argumentos 
try:
  server = sys.argv[1]
  lista = sys.argv[2]
  nome_p = sys.argv[0]
#Caso argumentos sejam passados errados, o programa sai
except:
  print("Argumentos invalidos")
  nome_p = sys.argv[0]
  print("USO: ./" + nome_p + " <DOMINIO> <WORDLIST>" )
  sys.exit()

try:
  lista = open(lista)
  subdominios = lista.read().splitlines()
except:
    print("Falha ao abrir o arquivo " + lista)
    sys.exit()

for subdominio in subdominios:
    try:
      domain = subdominio + '.' + server
      resultados = dns.resolver.query(domain, 'a')
      for resultado in resultados:
        print domain,  resultado
    except:
      pass
