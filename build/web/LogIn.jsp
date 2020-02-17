<%-- 
    Document   : LogIn
    Created on : 24/04/2018, 05:52:24 PM
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

	<body>
	<div class="hastaarriba"> 
		<span> <a href="index.html"> <img src="Images/Logo.jpg" id="logo"> </a> </span>
	</div>

	<span class="fulldashboard">

		<form  action="S_LogIn" method="get" enctype="multipart/form-data">
		    <table>
		    	<tr> <th colspan="2" class="titulo"> Iniciar Sesion</th> </tr> 
		    	<tr> 
		    		<td> <label>Nombre de usuario:</label> </td> 
		    		<td> <input type="text" name="username"> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Contrasena:</label> </td> 
		    		<td> <input type="password" name="pass"> </td>
		    	</tr>
		    	<tr>
		    		<td> <a href="index.jsp"> <input type="button" name="Cancelar" value="Cancelar" class="clickeable"> </a> </td>
		    		<td>  <a href="S_LogIn"> <input type="submit" name="Iniciar Sesion" value="Iniciar Sesion" class="clickeable"> </a> </td>
		    	</tr>
		    </table>		    
	  	</form>
		

	</span>

</body>
</html>
