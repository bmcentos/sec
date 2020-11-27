#!/usr/bin/python
import socket
import sys
import time
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((sys.argv[1],21))
time.sleep(2)
r = s.recv(4000)
s.send("USER anonymous\r\n")
r = s.recv(4000)
print r
s.send("PASS anonymous\r\n")
r = s.recv(4000)
print r
