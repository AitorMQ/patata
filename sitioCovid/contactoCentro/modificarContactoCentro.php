<?php
	require ('../include/conexion.php');
	$codigoCentro= mysqli_real_escape_string($con, $_POST["codigo"]);
	$nombre= mysqli_real_escape_string($con, $_POST["nombre"]);
	$apellido1= mysqli_real_escape_string($con, $_POST["apellido1"]);
	$apellido2= mysqli_real_escape_string($con, $_POST["apellido2"]);
	$movil= mysqli_real_escape_string($con, $_POST["movil"]);
	$email= mysqli_real_escape_string($con, $_POST["email"]);
	$contrasena= mysqli_real_escape_string($con, $_POST["contrasena"]);	
	
	$cmdModif="UPDATE registrocentros SET nombreContacto='".$nombre."',apellido1Contacto='".$apellido1."'";
	$cmdModif.=",apellido2Contacto='".$apellido2."',movil='".$movil."',email='".$email."'";
	$cmdModif.=",contrasena='".$contrasena."' WHERE codigoCentro=$codigoCentro";
	//echo $cmdModif;
	
	mysqli_query($con, $cmdModif);
	echo "modificado correctamente";
	exit;	
?>