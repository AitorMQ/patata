<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Registro</title>
   <!-- Bootstrap CSS
     <link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" /> -->
    <link rel="stylesheet" type="text/css" href="estilos.css"  />
<script src="include/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">			
	function valContrasena(contrasena)
	{	
		//salida=document.getElementById("txtContrasena");		
		//salida.innerHTML="";
		sw=0;
		
		// La contraseña debe tener al entre 6 y 20 caracteres, al menos un dígito, 
		// al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos.
		var patron=RegExp("^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,20}$","g");	// RegExp de nombre
														
		if(!patron.exec(contrasena))  // si todo va bien
		{			
			return false;
		}
		else
		    return true;
	}
	
	// **************  CÓDIGO JQUERY  **************
	$(document).ready(function(){     		    
  		    /*    *****************************************************************
  		          ********  Acción de ALTA DE UN CENTRO                   *********
  		      	  *****************************************************************
  		    */
  		    $("#btnAlta").click(function(){
  		    	centro=$('#cboCentros option:selected').val();	
  		    	nombre=$('#txtNombre').val();
  		    	apellido1=$('#txtApellido1').val();
  		    	apellido2=$('#txtApellido2').val();
  		    	movil=$('#txtMovil').val();
  		    	email=$('#txtEmail').val();
  		    	contrasena=$('#txtContrasena').val();
  		    	
  		    	if(valContrasena(contrasena)){  		    	
					$.ajax({
			    		url: "contactoCentro/altaContactoCentro.php",   // Recurso solicitado
			    		type: "POST",
			    		async: true,
			    	  	data: {codigo: centro, nombre:nombre, apellido1:apellido1, apellido2:apellido2, movil:movil, email:email, contrasena:contrasena}, // Parámetros enviados
			    	  	success: function(respuesta){
			    	  		if(respuesta!="error"){
			    	  			//alert(respuesta);    	  		
			    	  			deshabiAlta();
			    	  			
			    	  			$('#mensaje').css('color','red');
								$('#mensaje').html('<h3>' + 
								        'Contacto - ' + nombre + ' ' + apellido1 + ' - ' + respuesta + 
										'</h3><a href="contactoCentro/mantenContactoCentro.php">CONTINUAR</a>');
			    	  		}
			    	  	},		    	  	
			    	  	error: function(error){
			    	  		$('#errores').html(error);
			    	  	}
			    	});
			    }
			    else
			    {
			    	$('#errores').css('color','red');
				    $('#errores').css('background-color','gray');
			    	$('#errores').html('<h3>' + 'Error de contraseña' + 
			    		                   '</h3><a href="contactoCentro/mantenContactoCentro.php">CONTINUAR</a>');
			    }
			});
  		     
  		    /*    *****************************************************************
  		          ********  Acción de cancelacion del proceso de ALTA             *
  		      	  *****************************************************************
  		    */
  		    $("#btnCancelar").click(function(){
  		    	$('#cboCentros').val(-1);
  		    	$("#errores").html('');
  		    	  		    	
  		    	deshabiCancelar();
			});   		     
  		    
		
			/*    *****************************************************************
  		          *****  Elección del centro                                  *****                                
  		      	  *****************************************************************
  		    */
			$("#cboCentros").change(function(){
			    centro=$('#cboCentros option:selected').val();
				
				// Comprobamos si existe un contacto
				$.ajax({
			    		url: "contactoCentro/recupContactoCentro.php",   // Recurso solicitado
			    		type: "POST",
			    		async: true,
			    	  	data: {centro:centro}, // Parámetros enviados
			    	  	success: function(respuesta){
			    	  	    //alert(respuesta);
			    	  	    var objDatos=JSON.parse(respuesta);
		    	  		    codigoCentro=objDatos[0].codigoCentro;
		    	  		    if(codigoCentro!=-1)
		    	  		    {
		    	  		    	nombre=objDatos[0].nombre;
			    	  		    apellido1=objDatos[0].apellido1;
			    	  		    apellido2=objDatos[0].apellido2;
			    	  		    movil=objDatos[0].movil;
			    	  		    email=objDatos[0].email;
			    	  		    contrasena=objDatos[0].contrasena;
			    	  		    //alert(nombre);
			    	  		    $('#txtNombre').val(nombre);
			    	  		    $('#txtApellido1').val(apellido1);
			    	  		    $('#txtApellido2').val(apellido2);
			    	  		    $('#txtEmail').val(email);
			    	  		    $('#txtMovil').val(movil);
			    	  		    $('#txtContrasena').val(contrasena);
			    	  		    
			    	  		    $('#txtNombre').attr("disabled", false);
			    	  			$('#txtApellido1').attr("disabled", false);
			    	  			$('#txtApellido2').attr("disabled", false);
			    	  			$('#txtEmail').attr("disabled", false);
			    	  			$('#txtMovil').attr("disabled", false);
			    	  			$('#txtContrasena').attr("disabled", false);
			    	  			
			    	  			$('#btnModificar').attr("disabled", false);
				  				$('#btnEliminar').attr("disabled", false);
				  				$('#btnCancelar').attr("disabled", false);
		    	  		    }
		    	  		    else
		    	  		    {
		    	  		    	$('#txtNombre').attr("disabled", false);
		    	  		    	$('#txtNombre').focus();
		    	  		    	$('#txtApellido1').attr("disabled", false);
			    	  			$('#txtApellido2').attr("disabled", false);
			    	  			$('#txtEmail').attr("disabled", false);
			    	  			$('#txtMovil').attr("disabled", false);
			    	  			$('#txtContrasena').attr("disabled", false);
			    	  			
			    	  			$('#btnAlta').attr("disabled", false);
				  				$('#btnCancelar').attr("disabled", false);
		    	  		    }							
			    	  	},		    	  	
			    	  	error: function(error){
			    	  		$('#errores').html(error);
			    	  	}
			    	});
			});
			 			  		    
			
			/*    *****************************************************************
  		          ********  Acción de MODIFICACIÓN DE UN CENTRO           *********
  		      	  *****************************************************************
  		    */
				$("#btnModificar").click(function(){
				    centro=$('#cboCentros option:selected').val();
				    nombre=$('#txtNombre').val();
	  		    	apellido1=$('#txtApellido1').val();
	  		    	apellido2=$('#txtApellido2').val();
	  		    	movil=$('#txtMovil').val();
	  		    	email=$('#txtEmail').val();
	  		    	contrasena=$('#txtContrasena').val();
	  		    	
	  		    	if(valContrasena(contrasena))
					{						
						$.ajax({
				    		url: "contactoCentro/modificarContactoCentro.php",   // Recurso solicitado
				    		type: "POST",
				    		async: true,
				    	  	data: {codigo: centro, nombre:nombre, apellido1:apellido1, apellido2:apellido2, movil:movil, email:email, contrasena:contrasena}, // Parámetros enviados
				    	  	success: function(respuesta){
				    	  		if(respuesta!="error"){
				    	  			//alert(respuesta);    	  		
				    	  			deshabiModifElim();
				    	  			
				    	  			$('#mensaje').css('color','red');
									$('#mensaje').html('<h3>' + 
									        'Contacto del Centro' + ' - ' + respuesta + 
											'</h3><a href="contactoCentro/mantenContactoCentro.php">CONTINUAR</a>');
				    	  		}
				    	  	},		    	  	
				    	  	error: function(error){
				    	  		$('#errores').html(error);
				    	  	}
				    	});
				     }
				     else
				     {
				     	$('#errores').css('color','red');
				     	$('#errores').css('background-color','gray');
			    		$('#errores').html('<h3>' + 'Error de contraseña' + 
			    		                   '</h3><a href="contactoCentro/mantenContactoCentro.php">CONTINUAR</a>');
					 }					     
				});
			
			/*    *****************************************************************
  		          ********  Acción de ELIMINACION DE UN CENTRO            *********
  		      	  *****************************************************************
  		    */
				$("#btnEliminar").click(function(){
					centro=$('#cboCentros option:selected').val();
					$.ajax({
			    		url: "contactoCentro/eliminarContactoCentro.php",   // Recurso solicitado
			    		type: "POST",
			    		async: true,
			    	  	data: {codigo: codigoCentro}, // Parámetro enviado
			    	  	success: function(respuesta){
			    	  		if(respuesta!="error"){
			    	  			// alert(respuesta);
			    	  			    	  			    	  			
			    	  			deshabiModifElim();
			    	  			
			    	  			$('#mensaje').css('color','red');
								$('#mensaje').html('<h3>' + 
								        'Contacto del Centro' + ' - ' + respuesta + 
										'</h3><a href="contactoCentro/mantenContactoCentro.php">CONTINUAR</a>');
			    	  		}
			    	  	},		    	  	
			    	  	error: function(error){
			    	  		$('#errores').html(error);
			    	  	}
			    	});
				});
			
			
			/*    *****************************************************************
  		          ********             DESHABILITACIONES                  *********
  		      	  *****************************************************************
  		    */
			var deshabiAlta = function(){
				$('#txtNombre').attr("disabled", true);
				$('#txtApellido1').attr("disabled", true);
				$('#txtApellido2').attr("disabled", true);
				$('#txtMovil').attr("disabled", true);
				$('#txtEmail').attr("disabled", true);
				$('#txtContrasena').attr("disabled", true);			    	  			
			    
			    $('#btnModificar').attr("disabled", true);
			    $('#btnEliminar').attr("disabled", true);
    	  		$('#btnCancelar').attr("disabled", true);
			}
			
			var deshabiModifElim = function(){
				$('#txtNombre').attr("disabled", true);
				$('#txtApellido1').attr("disabled", true);
				$('#txtApellido2').attr("disabled", true);
				$('#txtMovil').attr("disabled", true);
				$('#txtEmail').attr("disabled", true);
				$('#txtContrasena').attr("disabled", true);			    	  			
			    
			    $('#btnModificar').attr("disabled", true);
			    $('#btnEliminar').attr("disabled", true);
    	  		$('#btnCancelar').attr("disabled", true);
			}
			
			var deshabiCancelar = function(){
				$("#txtNombre").val("");
  		    	$("#txtApellido1").val("");
  		    	$("#txtApellido2").val("");
  		    	$("#txtMovil").val("");
  		    	$("#txtEmail").val("");
  		    	$("#txtContrasena").val("");
  		    	
  		    	$('#txtNombre').attr("disabled", true);
				$('#txtApellido1').attr("disabled", true);
				$('#txtApellido2').attr("disabled", true);
				$('#txtMovil').attr("disabled", true);
				$('#txtEmail').attr("disabled", true);
				$('#txtContrasena').attr("disabled", true);	
				
			    $('#btnAlta').attr("disabled", true);
  				$('#btnCancelar').attr("disabled", true);
  				$('#btnModificar').attr("disabled", true);
				$('#btnEliminar').attr("disabled", true);
  					
  				$('#spanErrorCodigo').val("");
			}			
  		 });		
</script>    	
</head>
	<body>
		<div id="errores"></div>
		
		<div class="contenedor">			
			<div id="mensaje"></div>			
			<!-- INTERFAZ -->
			<form action="" method="post" name="frmManten" id="frmManten">
			<fieldset id="seleccionCentro" class="frmCentrosfieldset">
				<legend style="color:red; font-size:20px; font-weight:bold">Seleccione el centro</legend>
        		<div>
	        		<select name="cboCentros" id="cboCentros" style="width:300px"  >
					<option selected="selected" value="-1">--Centros--</option>				
						<?php /*CARGAMOS EL DROP-DOWN BOX CON LOS CENTROS ACTUALES*/
							require('include/conexion.php');
							$query="SELECT codigoCentro,nombre FROM centros ORDER BY codigoCentro ASC";
							//echo $query;
							$result=mysqli_query($con,$query);
							while($fila = mysqli_fetch_array($result, MYSQLI_ASSOC))
							{	
								echo '<option value="' .$fila["codigoCentro"]. '">' .$fila["nombre"]. '</option>';
							}
							mysqli_close($con);
						?>					
					</select><span id="spanCentro"></span>
					<br/><br/><br/>
					
					    <label id="lblNombre">NOMBRE</label>					    
						<input  id="txtNombre" type="text" maxlength="20" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanNombre"></span>
						<br/><br/>
						
						<label id="lblApellido1">APELLIDO 1</label>
						<input  id="txtApellido1" type="text" maxlength="25" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanApellido1"></span>
					  	<br/><br/>
					  	
					  	<label id="lblApellido2">APELLIDO 2</label>
					  	<input  id="txtApellido2" type="text" maxlength="25" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanApellido2"></span>
					  	<br/><br/>
					  	
					  	<label id="lblMovil">MÓVIL</label>
					  	<input  id="txtMovil" type="text" maxlength="12" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanMovil"></span>
					  	<br/><br/>
					  	
					  	<label id="lblEmail">EMAIL</label>
					  	<input  id="txtEmail" type="text" maxlength="80" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanEmail"></span>
					  	<br/><br/>
					  	
					  	<label id="lblContrasena">CONTRASEÑA</label>
					  	<input  id="txtContrasena" type="text" maxlength="20" 
					  			disabled="disabled" style="width: 200px; margin-left:10px;" value="" class="azul-input">
					  		&nbsp;&nbsp;&nbsp;&nbsp;
					  	<span id="spanContrasena"></span>
					  	<br/><br/>
						
						<input id="btnAlta" type="button" value="ALTA" disabled="disabled"  >
						<input id="btnModificar" type="button" value="MODIFICAR" disabled="disabled"  >
						<input type="button" id="btnEliminar" value="ELIMINAR" disabled="disabled" />
						<input id="btnCancelar" type="button" value="CANCELAR" disabled="disabled"  >
			     </div>
			</fieldset>
			</form>
		</div>					 
	</body>
</html>

