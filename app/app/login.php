<?php
	$mc = mysql_connect('localhost', 'root', '');
	mysql_select_db('app', $mc);

	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$sql = "SELECT * FROM login WHERE usuario = '$usuario' AND senha='$senha'";
	$query = mysql_query($sql);

	if (mysql_num_rows($query) == 1){
		header("location:admin.php");
	}
	else
	{
		echo "Usuario ou senha invalido";
	}
?>
