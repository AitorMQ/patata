<?php
	require ('../include/conexion.php');
	$codigoCentro= mysqli_real_escape_string($con, $_POST["codigo"]);
	$nombre= mysqli_real_escape_string($con, $_POST["nombre"]);
	$apellido1= mysqli_real_escape_string($con, $_POST["apellido1"]);
	$apellido2= mysqli_real_escape_string($con, $_POST["apellido2"]);
	$movil= mysqli_real_escape_string($con, $_POST["movil"]);
	$email= mysqli_real_escape_string($con, $_POST["email"]);
	$contrasena= mysqli_real_escape_string($con, $_POST["contrasena"]);	
	
	$cmdAlta="INSERT INTO registrocentros (codigoCentro,nombreContacto,apellido1Contacto,apellido2Contacto,";
	$cmdAlta.="movil,email,contrasena) VALUES ('".$codigoCentro."','".$nombre."','".$apellido1."'";
	$cmdAlta.=",'".$apellido2."','".$movil."','".$email."','".$contrasena."')";
	//echo $cmdAlta;
	
	mysqli_query($con, $cmdAlta);
	echo "dado de alta correctamente";
	exit;	
?>