#!/usr/bin/python
import socket
import sys
import re

if len(sys.argv) != 2:
    print "Modo de uso:\n python smtp_enum.py IP USERNAME"
    sys.exit(0)

file = open('lista.txt')
for linha in file.readlines():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((sys.argv[1],25))
    resp = s.recv(1024)
    s.send("VRFY "+linha)
    resp = s.recv(1024)
    if re.search('252',resp):
        print "Usuario encontrado:" +resp.strip('252 2.0.0')
