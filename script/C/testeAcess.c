#include <stdio.h>
#include <stdlib.h>
#define password "Admin"
#define password2 "admin"

verifica(){
char pw[400];
	printf("Entre com a senha: ");
	gets(pw);
	if (strcmp(pw, password2) == 0)
		printf("Quase... Achou que ia ser só isso\n");
	else if (strcmp(pw, password) == 0)
			acessa();
	else
		printf("Acesso negado\n");
	return 0;
}
acessa(){
	printf("Parabens, voce conseguiu\n");
	return 0;
}
int main (int argc, char *argv[])
{	
	if(argc > 1){
		printf("Tenta mais\n");
		exit(1);}
	verifica();
	return 0;
}
