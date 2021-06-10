<?php
	session_start();
	if(isset($_POST['btLogout']))
	{
	 	unset($_SESSION['codigoCentro']);
	 	unset($_SESSION['email']);
	 	echo 'DESCONECTADO';
	}
	else
	{
	    echo 'CENTRO: ' . $_SESSION['nombreCentro'] . '<br /><br /> ';
	    echo 'Bienvenid@ ' . $_SESSION['nombreContacto'] . ' ' .  $_SESSION['apellido1Contacto'];
	}
?>

<html>
<body>
 <h2>HOLA</h2>
 <form method='post'>
  	<input type='submit' name='btLogout' value='Desconectar'>
 </form>
</body>
</html>