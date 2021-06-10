<?php
	require("../include/conexion.php");
	$codigoFamilia= mysqli_real_escape_string($con, $_POST["familia"]);
	$codigoCiclo= mysqli_real_escape_string($con, $_POST["ciclo"]);
	$codigoModelo= mysqli_real_escape_string($con, $_POST["modelo"]);
	$codigoIdioma= mysqli_real_escape_string($con, $_POST["idioma"]);
	$codigoModulo= mysqli_real_escape_string($con, $_POST["modulo"]);
	
	$cmdConsulta="SELECT COUNT(*) as filas FROM modulos ";
	$cmdConsulta.="WHERE codCiclo='".$codigoCiclo."' AND codFamilia='".$codigoFamilia."' ";
	$cmdConsulta.="AND codModelo=$codigoModelo AND idioma='".$codigoIdioma."' ";
	$cmdConsulta.="AND codModulo='".$codigoModulo."'";
	//echo $cmdConsulta;
	if($resultado=mysqli_query($con, $cmdConsulta))
	{
		$fila=mysqli_fetch_assoc($resultado);
		if($fila['filas']==0)
		   echo 'noexiste';
		else 
		   echo 'existe';
	}
	exit;	
?>