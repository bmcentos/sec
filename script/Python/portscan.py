#coding: utf-8 #Necessario para usar os comentarios 

#Faz o import do modulo Socket
import socket

# Define as portas para o teste
portas = [ 21, 22, 23, 25, 80, 443, 8080 ]
host = 'bancocn.com'

# Realiza o loop para teste das portas
print "PortScan in host: ", host, "\n"
for porta in portas:
    cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente.settimeout(0.5)
    codigo = cliente.connect_ex((host, porta))
    if codigo == 0:
        print porta, "OPEN"
#    if codigo != 0:
#        print porta, "CLOSE"

