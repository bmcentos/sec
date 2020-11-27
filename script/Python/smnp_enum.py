#!/usr/bin/python
import socket
import sys

if len(sys.argv) != 3:
    print "Modo de uso:\n python smtp_enum.py IP USERNAME"
    sys.exit(0)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((isys.argv[1],25))
banner = s.recv(1024)
print banner

s.send("VRFY "+sys.argv[2]+"\r\n")
r = s.recv(1024)
print r
