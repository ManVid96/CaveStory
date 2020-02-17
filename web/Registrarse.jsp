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

		<form class="registrarse" action="S_Registro" method="post" enctype="multipart/form-data">
		    <table>
		    	<tr> <th colspan="2" class="titulo"> Registrarse</th> </tr> 
		    	<tr> 
		    		<td> <label>Nombre de usuario:</label> </td> 
		    		<td> <input type="text" name="username" required> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Correo Electronico:</label> </td> 
		    		<td> <input type="email" name="email" required> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Contrasena:</label> </td> 
		    		<td> <input type="password" name="pass" required> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Fecha de Nacimiento:</label> </td> 
		    		<td> <input type="date" name="date" required> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Sexo:</label> </td> 
		    		<td> 
		    			<select type="select" name="gender" required>
	              		<option>Hombre</option>
	              		<option>Mujer</option>
	               		<option>Otro</option>
	           			</select> 
           			</td>
		    	</tr>
                        
                         <script type="text/javascript">

                            $(function()
                            {
                                $('#file').on('change',function ()
                                {
                                    var filePath = $(this).val();
                                    document.getElementById('hidden').value = filePath;
                                });
                            });

                        </script>
                        
		    	<tr> 
		    		<td> <label>Foto de Perfil:</label> </td> 
		    		<td> <input type="file" name="file" id="file" required> </td>
                                <td> <input type="hidden" name="hidden" id="hidden"> </td>
		    	</tr>
                        
                                               
                        <tr>
		    		<td colspan="2"> 
		    			<a href="index.jsp"> <input type="button" name="Cancelar" value="Cancelar" class="clickeable"> </a> 
		    			<input type="submit" name="Crear" value="Crear Cuenta" class="clickeable">
		    		</td>
		    	</tr>
		    </table>		    
	  	</form>
		

	</span>

</body>
</html>