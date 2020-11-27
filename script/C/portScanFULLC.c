#include <stdio.h>
#include <netdb.h>

main(int argc, char *argv[])
{
	int meusocket;
	int conecta;
	int port;
	int inicio = 0;
	int final = 65535;
	char * destino;
	destino = argv[1];
	
	 if(argc<2)
        {
                printf("ERRO - Uso invalido\n \nInforme o IP do host \n\n Uso: ./portScanFULLC <IP>\n");
                return 0;
	}
	struct sockaddr_in alvo;
	for(port=inicio;port<final;port++)
	{

	meusocket = socket(AF_INET, SOCK_STREAM, 0);
	alvo.sin_family = AF_INET;
	alvo.sin_port = htons(port);
	alvo.sin_addr.s_addr = inet_addr(destino);

	conecta = connect(meusocket, (struct sockaddr *)&alvo, sizeof alvo);

	if(conecta == 0)
	{
		printf("Porta %d - [OPEN]\n", port);
		close(meusocket);
		close(conecta);
	}else{
		close(meusocket);
		close(conecta);
	}

}
}
