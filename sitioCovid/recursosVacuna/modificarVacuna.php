<?php
    $conexion = mysqli_connect('localhost','root','','covid');
    $codigo= $_POST["codigo"];
    $nombre= $_POST["nombre"];
    $fehaAprobacion= $_POST["fecha"];
    $suspendida= $_POST["suspendida"];
    $codEmpresa= $_POST["codEmpresa"];
    $numeroDeDosis= $_POST["dosis"];
    $limiteMinimoDias= $_POST["minimo"];
    $limiteMaximoDias= $_POST["maximo"];
    $efectosSecundarios= $_POST["efectos"];
    $tipoVacuna= $_POST["tipo"];



    $cmdModif="UPDATE vacunas SET nombre='".$nombre."',fehaAprobacion='".$fehaAprobacion."'";
    $cmdModif.=",codEmpresa='".$codEmpresa."',numeroDeDosis='".$numeroDeDosis."',limiteMinimoDias='".$limiteMinimoDias."'";
    $cmdModif.=",limiteMaximoDias='".$limiteMaximoDias."'efectosSecundarios='".$efectosSecundarios."',tipoVacuna='".$tipoVacuna."' WHERE codigo=$codigo";
    //echo $cmdModif;

    mysqli_query($conexion, $cmdModif);
    echo "modificado correctamente";
    exit;
?>