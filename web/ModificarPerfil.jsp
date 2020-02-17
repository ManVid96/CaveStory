<%-- 
    Document   : Registrarse
    Created on : 24/04/2018, 06:14:39 PM
    Author     : javie
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
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
            <%
            Connection con = Conexion.getConexion();
            String usuario = request.getParameter("usuario");
            PreparedStatement stmtPopu = null;
            String queryPopu = "select * from usuario where usuario = ?;";
            stmtPopu = con.prepareStatement(queryPopu);
            stmtPopu.setString(1, usuario);
            ResultSet rs = stmtPopu.executeQuery();
            
            if(rs.next()){
            String correo = rs.getString("correoUsuario");
            %>
		<form class="registrarse" action="S_ModificarUsuario" method="get" enctype="multipart/form-data">
		    <table>
		    	<tr> <th colspan="2" class="titulo"> Modificar</th> </tr> 
		    	<tr> 
		    		<td> <label>Nombre de usuario:</label> </td> 
                                <td> <input type="text" name="usuario" value="<%=usuario%>" required readonly> </td>
		    	</tr>
		    	<tr> 
		    		<td> <label>Correo Electronico:</label> </td> 
		    		<td> <input type="email" name="email" value="<%=correo%>" required> </td>
		    	</tr>
                        <tr> 
		    		<td> <label>Contraseña:</label> </td> 
		    		<td> <input type="text" name="contra" id="file2" required> </td>
		    	</tr>
                        <tr>
		    		<td colspan="2"> 
                                        <!--<a href="ElimUser.jsp"> <input type="button" name="Baja" value="Eliminar Cuenta" class="clickeable"> </a>-->
		    			<a href="index.jsp"> <input type="button" name="Cancelar" value="Cancelar" class="clickeable"> </a> 
		    			<input type="submit" name="Crear" value="Guardar Cambios" class="clickeable">
		    		</td>
		    	</tr>
		    </table>		    
	  	</form>
            <%
            }
            %>

	</span>

</body>
</html>