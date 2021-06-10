<?php

            $codigo=$_POST['cod'];
            $conexion = mysqli_connect('localhost','root','','covid');
            $sql = "CALL pr_datos($codigo)";
            $consulta = mysqli_query($conexion,$sql);
            
            while($datos =mysqli_fetch_assoc($consulta))
            {	
                $codigo=$datos['codigo'];
                $nombre=$datos['nombre'];
                $fehaAprobacion=$datos['fehaAprobacion'];
                $suspendida=$datos['suspendida'];
                $codEmpresa=$datos['codEmpresa'];
                $numeroDeDosis=$datos['numeroDeDosis'];
                $limiteMinimoDias=$datos['limiteMinimoDias'];
                $limiteMaximoDias=$datos['limiteMaximoDias'];
                $efectosSecundarios=$datos['efectosSecundarios'];
                $tipoVacuna=$datos['tipoVacuna'];
               $json2[]=array('codigo'=> $codigo,'nombre'=>$nombre,'fehaAprobacion'=>$fehaAprobacion,'suspendida'=>$suspendida,'codEmpresa'=>$codEmpresa,'numeroDeDosis'=>$numeroDeDosis,'limiteMinimoDias'=>$limiteMinimoDias,'limiteMaximoDias'=>$limiteMaximoDias,'efectosSecundarios'=>$efectosSecundarios,'tipoVacuna'=>$tipoVacuna);     
            }
            echo json_encode($json2);
    
    
    
  
?>