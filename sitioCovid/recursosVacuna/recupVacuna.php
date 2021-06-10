<?php
	
	$conexion = mysqli_connect('localhost','root','','covid');
    $sql = " select codigo,nombre from vacunas";
   /* $consulta = mysqli_prepare($conexion,$sql );
     mysqli_stmt_execute($consulta); 
     mysqli_stmt_get_result($consulta);*/
     $consulta = mysqli_query($conexion,$sql);
     while($datos =mysqli_fetch_assoc($consulta))
     {	
		    $codigo=$datos['codigo'];
        $nombre=$datos['nombre'];
        $json[]=array('codigo'=> $codigo,'nombre'=>$nombre);     
     }
     echo json_encode($json);
?>