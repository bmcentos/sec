#include <stdio.h>
#include <string.h>

int main (int argc, char*argv[])
{
	int naoacessa = 0;
	char buff[8];
	printf("Variavel naoacessa tem %s bts\n",naoacessa);

	strcpy(buff, argv[1]);
	if(naoacessa == 0)
	{
		printf("Acesso Negado\n");
	}
	else
	{
		printf("Acesso Ok\n");
		printf("Buffer Over Flow, naoacessa vale %c\n",naoacessa);
	}
	return 0;
}
