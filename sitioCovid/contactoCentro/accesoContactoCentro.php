<?php
	session_start();
	if(isset($_POST['hacerLogin']))
	{
		 $host="localhost";
		 $username="root";
		 //<a href="hacerLogin_V1.php">hacerLogin_V1.php</a> 
		 $password="";
		 $databasename="covid";
		 $connect=mysqli_connect($host,$username,$password,$databasename);
				
		 $email=$_POST['email'];
		 $contrasena=$_POST['pass'];
		 
		 $strConsulta="select regCen.codigoCentro codigoCentro, regCen.nombreContacto nombreContacto, regCen.apellido1Contacto apellido1Contacto,";
		 $strConsulta.="regCen.apellido2Contacto apellido2Contacto, centros.nombre nombreCentro";
		 $strConsulta.=" from registroCentros regCen JOIN centros ON regCen.codigoCentro=centros.codigoCentro";
		 $strConsulta.=" where regCen.email='$email' and regCen.contrasena='$contrasena'";
		 //echo $strConsulta;
		 $datos=mysqli_query($connect,$strConsulta);
		 
		 if($fila=mysqli_fetch_assoc($datos))
		 {
			  $_SESSION['codigoCentro']=$fila['codigoCentro'];
			  $_SESSION['nombreCentro']=$fila['nombreCentro'];
			  $_SESSION['nombreContacto']=$fila['nombreContacto'];
			  $_SESSION['apellido1Contacto']=$fila['apellido1Contacto'];
			  $_SESSION['apellido2Contacto']=$fila['apellido2Contacto'];
			  echo "existe";
		 }
		 else
		 {
		  	  echo "no existe este usuario";
		 }
		 
		 exit();
	}
?>