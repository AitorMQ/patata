<?php
	$conexion = new mysqli("localhost", "root", "", "covid");
	$codigo= mysqli_real_escape_string($conexion, $_POST["codigo"]);
	
	$cmdEliminar="DELETE FROM vacunas WHERE codigo=$codigo";
	//echo $cmdEliminar;
	
	mysqli_query($conexion, $cmdEliminar);
	echo "eliminado correctamente";
	exit;	
?>