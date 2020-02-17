<%-- 
    Document   : SubirVideo
    Created on : 24/04/2018, 06:33:24 PM
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
		<span> <a href="index.jsp"> <img src="Images/Logo.jpg" id="logo"> </a> </span>
	</div>

	<span class="fulldashboard">

			<form  action="S_SubirVideo" method="post" enctype="multipart/form-data">
			    <table>
			    	<tr> <th colspan="2" class="titulo"> Llene los datos</th> </tr> 
			    	<tr> 
			    		
	       				<td> <input type="text" name="nombreUsuario" value="<%=session.getAttribute("usuario")%>" hidden > </td>
                                        <td> <input type="text" name="idUsuario" value="<%=session.getAttribute("id")%>" hidden > </td>
			    	</tr>
                                <tr> 
			    		<td> <label for="name">Titulo del video</label> </td>
	       				<td> <input type="text" name="titulo" required> </td>
			    	</tr>
			    	<tr> 
			    		<td> <label for="textarea">Descripcion:</label> </td>
	       				<td> <textarea name="description"> </textarea> </td>
			    	</tr>
			    	<tr>
			    		<td>Video</td>
			    		<td colspan=> <input type="file" id="files" nombreUsuario="" name="video" accept="video/mp4" required/> </td>
			    	</tr>
			    	<tr>
			    		<td>Foto</td>
			    		<td colspan=> <input type="file" id="files" name="foto" accept="image/*" required /> </td>
			    	</tr>
			    	<tr>
			    		<td colspan="2"> <a href="Perfil.jsp"> <input type="button" value="Cancelar" class="clickeable"> &nsbn </a> 
                                            <input type="submit" value="Aceptar" class="clickeable"> </td>
		    		</tr>
			    </table>		    
		  	</form>
	</span>

</body>
</html>
