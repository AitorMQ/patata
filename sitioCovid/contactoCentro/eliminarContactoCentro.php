<?php
	require ('../include/conexion.php');
	$codigoCentro= mysqli_real_escape_string($con, $_POST["codigo"]);
	
	$cmdEliminar="DELETE FROM registrocentros WHERE codigoCentro=$codigoCentro";
	//echo $cmdEliminar;
	
	mysqli_query($con, $cmdEliminar);
	echo "eliminado correctamente";
	exit;	
?>