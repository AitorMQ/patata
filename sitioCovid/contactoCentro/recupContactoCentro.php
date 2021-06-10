<?php
	require("../include/conexion.php");
	$centro= mysqli_real_escape_string($con, $_POST["centro"]);

	$cmdConsulta="CALL pr_RecuDatosRegCentros($centro)";
	//$cmdConsulta.=" AND idioma='".$idioma."'";
	
	//echo $cmdConsulta;
		
	//$datos = array();
	if($resultado=mysqli_query($con, $cmdConsulta))
	{
		$fila=mysqli_fetch_assoc($resultado);
		
		$codigoCentro=$fila['codigoCentro'];
		if($codigoCentro==-1)
		{
		    $centros[] = array('codigoCentro'=> $codigoCentro);
		}
		else
		{
		    $nombre=$fila['nombreContacto'];
		    $apellido1=$fila['apellido1Contacto'];	    
		    $apellido2=$fila['apellido2Contacto'];
		    $movil=$fila['movil'];
		    $email=$fila['email'];
		    $contrasena=$fila['contrasena'];
		
    		$centros[] = array('codigoCentro'=> $codigoCentro,'nombre'=> $nombre, 'apellido1'=> $apellido1,'apellido2'=> $apellido2,'movil'=> $movil,'email'=> $email,'contrasena'=> $contrasena);
		}
		
	    // Creamos el formato JSON
	    echo json_encode($centros);
	    
		// Cerrar la conexiÃ³n
		mysqli_close($con);
		// Liberar resultados
		mysqli_free_result($resultado);
		
		exit;
	 }
	
	// Cerrar la conexiÃ³n
	mysqli_close($con);
	exit;	 
?>