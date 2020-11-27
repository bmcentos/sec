#!/usr/bin/python

import socket
ip = raw_input("IP: ")
porta = input("Digite a porta: ")

meusocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
if meusocket.connect_ex((ip, porta)):
    print "Porta Fechada"
else:
    print "Porta Aberta"
