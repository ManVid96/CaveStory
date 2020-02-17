<%-- 
    Document   : Registrarse
    Created on : 24/04/2018, 06:14:39 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>BitPlay</title>
	<link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
	<link rel="stylesheet" type="text/css" href="CSS/Forms.css">
        
       
        
</head>
<body>

	<div class="hastaarriba"> 
		<span> <a href="index.jsp"> <img src="Images/Logo.jpg" id="logo"> </a> </span>
	</div>

	<span class="fulldashboard">

		<form class="registrarse" action="S_ModUser" method="post" enctype="multipart/form-data">
		    <table>
		    	<tr> <th colspan="2" class="titulo"> Modificar</th> </tr> 
		    	<tr> 
		    		<td> <label>Nombre de usuario:</label> </td> 
		    		<td> <input type="text" name="username" required> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Correo Electronico:</label> </td> 
		    		<td> <input type="email" name="email" required> </td>
		    	</tr>
                        
		    	<tr> 
		    		<td> <label>Foto de Perfil:</label> </td> 
		    		<td> <input type="file" name="file" id="file" required> </td>
		    	</tr>
                        <tr> 
		    		<td> <label>Foto de Portada:</label> </td> 
		    		<td> <input type="file" name="file2" id="file2" required> </td>
		    	</tr>
                        <tr>
		    		<td colspan="2"> 
                                        <a href="ElimUser.jsp"> <input type="button" name="Baja" value="Eliminar Cuenta" class="clickeable"> </a>
		    			<a href="index.jsp"> <input type="button" name="Cancelar" value="Cancelar" class="clickeable"> </a> 
		    			<input type="submit" name="Crear" value="Crear Cuenta" class="clickeable">
		    		</td>
		    	</tr>
		    </table>		    
	  	</form>
		

	</span>

</body>
</html>