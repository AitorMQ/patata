<?php
    $conexion = mysqli_connect('localhost','root','','covid');
    $codigo= mysqli_real_escape_string ($conexion,$_POST["codigo"]);
    $nombre= mysqli_real_escape_string ($conexion,$_POST["nombre"]);
    $fehaAprobacion= mysqli_real_escape_string ($conexion,$_POST["fecha"]);
    $suspendida= mysqli_real_escape_string ($conexion,$_POST["suspendida"]);
    $codEmpresa= mysqli_real_escape_string ($conexion,$_POST["codEmpresa"]);
    $numeroDeDosis= mysqli_real_escape_string ($conexion,$_POST["dosis"]);
    $limiteMinimoDias= mysqli_real_escape_string ($conexion,$_POST["minimo"]);
    $limiteMaximoDias= mysqli_real_escape_string ($conexion,$_POST["maximo"]);
    $efectosSecundarios= mysqli_real_escape_string ($conexion,$_POST["efectos"]);
    $tipoVacuna= mysqli_real_escape_string ($conexion,$_POST["tipo"]);
	
	$cmdAlta="INSERT INTO vacunas (codigo,nombre,fehaAprobacion,suspendida,";
	$cmdAlta.="codEmpresa,numeroDeDosis,limiteMinimoDias,limiteMaximoDias,efectosSecundarios,tipoVacuna) VALUES ('".$codigo."','".$nombre."','".$fehaAprobacion."','".$suspendida."','".$codEmpresa."','".$numeroDeDosis."',";
	$cmdAlta.=",'".$limiteMinimoDias."','".$limiteMaximoDias."','".$efectosSecundarios."','".$tipoVacuna."')";
	//echo $cmdAlta;
	
	mysqli_query($cononexion, $cmdAlta);
	echo "dado de alta correctamente";
	exit;	
?>