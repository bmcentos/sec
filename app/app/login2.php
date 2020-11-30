<?php
	$mc = mysqli_connect("localhost", "root", "root", "app");
	mysqli_set_charset($mc, 'utf8');

	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$sql = "SELECT * FROM login WHERE usuario = '$usuario' AND senha = '$senha' ";
	$query = mysqli_query($mc, $sql);

	if (mysqli_num_rows($query) == 1){
		header("location:admin.php");
	}
	else
	{
		echo "Usuario ou senha invalido";
	}

 	if (mysqli_connect_errno())
	{
   		 echo 'Falha ao conectar ao MySQL.';
	}

?>
