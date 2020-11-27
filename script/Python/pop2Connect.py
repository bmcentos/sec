#/usr/bin/python

import socket
try:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("195.177.177.17",110))
    r = s.recv(1024)
    print r

    s.send("USER admin\r\n")
    r = s.recv(1024)
    print r

    s.send("PASS admin\r\n")
    r = s.recv(1024)
    print r

    s.send("QUIT\r\n")
    r = s.recv(1024)
    print r
except:
    print "Erro ao conectar"
