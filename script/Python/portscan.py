#!/usr/bin/python

import socket,sys

for porta in range(1,65535):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    if s.connect_ex((sys.argv[1], porta)) == 0:
        print "Porta: ",porta," [OPEN]"
        s.close()
