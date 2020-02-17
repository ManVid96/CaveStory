<%-- 
    Document   : ModificarVideo
    Created on : 24/04/2018, 06:25:53 PM
    Author     : javie
--%>

<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            <%
            Connection con = Conexion.getConexion();
            PreparedStatement stmt = null;
            String idVid = request.getParameter("idVideo");
            String query = "select * from video where idVideo = ?;";
            stmt = con.prepareStatement(query);
            stmt.setString(1, idVid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()){
            String nombre = rs.getString("titulo");
            String descripcion = rs.getString("descripcion");
            %>
                <br><br><br>
		<form class="registrarse" action="S_ModificarVideo" method="get" enctype="multipart/form-data">
			    <table>
                                <tr> <th colspan="2" class="titulo">Modificar Video</th> </tr> <br>
			    	<tr> 
                                    <td> <label for="name" >Titulo del video</label> </td>
	       				<td> <input type="text" name="titulo" value="<%=nombre%>"> 
                                        <input type="text" name="idVideo" value="<%=idVid%>" hidden></td>
			    	</tr>
			    	<tr> 
			    		<td> <label for="textarea">Descripcion:</label> </td>
                                        <td> <textarea name="descripcion"> <%=descripcion%> </textarea> </td>
			    	</tr>
			    	<tr>
			    		<td colspan="2"> <a href="Perfil.jsp"> <input type="button" name="Cancelar" value="Cancelar" class="clickeable"> &nsbn </a> 
                                            <input type="submit" name="Guardar Cambios" value="Guardar Cambios" class="clickeable"> </td>
		    		</tr>
			    </table>		    
		  	</form>
            <%
                }
            %>
	</span>

</body>
</html>