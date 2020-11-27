#include <stdio.h>

int main(int argc, char *argv[])
{
	if(argc<2)
	{
		printf("Informe o IP e PORTA");
		return 0;
	}else{
		printf("Varrendo host %s na porta %s \n", argv[1],argv[2]);
		return 0;
	}
}
