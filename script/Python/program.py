#!/usr/bin/python
porta = int(raw_input("Digite a porta :"))
ip = raw_input("Digite o IP: ")
if (porta < 0):
    print "Digite uma porta valida"
else:
    print "Porta: " , porta, "IP: ", ip
