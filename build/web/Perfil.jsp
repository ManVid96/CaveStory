<%-- 
    Document   : Perfil
    Created on : 24/04/2018, 06:29:26 PM
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
	<link rel="stylesheet" type="text/css" href="CSS/EstiloPerfil.css">
</head>
<body>

	<div class="hastaarriba"> 
		<span> <a href="index.jsp" class="invisible"> <img src="Images/Logo.jpg" id="logo"> </a> </span>
		<span class="buscar enlinea"> <input class="buscar enlinea" type="text" placeholder="Buscar"> </span>
		<span> <input type="image" src="Images/buscar.png" class="buscar enlinea"> </span>
		<span id="aladerecha">
                    
                    <%
                        
                        if (session.getAttribute("foto") == null){
                        
                    %>
			<a href="Registrarse.jsp"> <input type="button" class="enlinea clickeable" value="Registrarse"> </a>
			<a href="LogIn.jsp"> <input type="button" class="enlinea clickeable" value="Iniciar Sesion"> </a>
                    <%
                      } else {       
                      
                      
                    %>
                                <img class="icono2 enlinea clickeable" src="data:image/png;base64,<%=session.getAttribute("foto")%>" alt="Pos no" onclick="AlPerfil()">
                                <a href="S_CerrarSesion"> <input type="button" class="enlinea clickeable" value="Cerrar Sesion"> </a>
                    <%
                      }                      
                    %>
		</span>
	</div>

	<span class="lateral"> 
		<div class="elemento"> Inicio </div>
		<div class="elemento"> Subscripiciones </div>
		<hr>
		<div class="elemento"> Categorías </div>
		<hr>
		<a href="index.jsp" >   <div class="elemento clickeable"> &nbsp&nbsp Más Populares </div> </a>
		<a href="index.jsp" >   <div class="elemento clickeable"> &nbsp&nbsp Más Vistos </div> </a>
		<a href="index.jsp" >   <div class="elemento clickeable"> &nbsp&nbsp Más Recientes </div> </a>
	</span>

	<span class="dashboard">
		<div>
            <%
                Connection con = Conexion.getConexion();
            PreparedStatement stmt = null;
                        
            String query = "select * from usuario where usuario = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, request.getParameter("usuario"));
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
            Blob portada = rs.getBlob("portada");
                if(portada != null){
                byte[] bytesimagen = portada.getBytes(1, (int)portada.length());
            String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
            

            %>
			<img class="portada" id="portada" src="data:image/png;base64,<%=ba64%>">
            <%
                } else {
            %>
                        <img class="portada" id="portada" src="Images/Portada.jpg">
            <%
                }
            
            %>
		</div>
		<div>
            <%
                
                Blob avatar = rs.getBlob("avatar");
                if(avatar != null){
                    byte[] bytesimagen2 = avatar.getBytes(1, (int)avatar.length());
                    String ba642 = Base64.getEncoder().encodeToString(bytesimagen2);
            %>     
			<span> <img src="data:image/png;base64,<%=ba642%>" class="pp" ></span>
            <% 
                }
            }
            %>
			<span class="saltolinea"> <%=rs.getString("usuario")%>
			</span>
		</div>
		<hr>

                <% 
                if ((session.getAttribute("foto") != null) && !((session.getAttribute("usuario")).equals(request.getParameter("usuario")))){
                %>
                
		<div class="sub">
			<input type="button" class="enlinea clickeable" value="Subscribirse">
		</div>	
                <% 
                } if ((session.getAttribute("usuario")).equals(request.getParameter("usuario"))) {
                %>
                <div class="sub">
                    <a href="ModificarPerfil.jsp?usuario=<%=session.getAttribute("usuario")%>"> <input type="button" class="enlinea clickeable" value="Modificar Perfil"> </a>
		</div>	
                <% 
                }
                %>
		<br>
                <br>

		<div>
			<%
                                //Connection con = Conexion.getConexion();
                           PreparedStatement stmtPopu = null;

                                String queryPopu = "select * from video inner join usuario on video.idUsuario = usuario.idUsuario where usuario.usuario = '"+request.getParameter("usuario")+"';";
                                stmtPopu = con.prepareStatement(queryPopu);
                                ResultSet rsPopu = stmtPopu.executeQuery();
                                
                                while(rsPopu.next()){
                                    Blob portada = rsPopu.getBlob("imagen");
                                    byte[] bytesimagen = portada.getBytes(1, (int)portada.length());
                                    String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
                                    int idVideo = rsPopu.getInt("idVideo");
                                    String nombre = rsPopu.getString("titulo");
                                    String descrip = rsPopu.getString("descripcion");
                                
                            %>
                            <span> <a href="VerVideo.jsp?idVideo=<%=idVideo%>&idUsuariotl=<%=session.getAttribute("id") %>" class="invisible"> <img src="data:image/png;base64,<%=ba64%>" class="video clickeable"> </a> </span> 
                            <span> <b class="video"> <%=descrip%></b> </span>
                            <% 
                            if ((session.getAttribute("usuario")).equals(request.getParameter("usuario"))) {
                            %>
                            <a href="ModificarVideo.jsp?idVideo=<%=idVideo%>"> <input type="button" class="enlinea clickeable" value="Modificar Video"> </a>
                            <form class="registrarse" action="S_EliminarVideo" method="get" enctype="multipart/form-data">
                                <span> <input type="number" name="idVideo" value ="<%=idVideo%>" hidden> </span>
                                <span> <input type="submit" class="enlinea clickeable" value="Eliminar Video"> </span>
                            </form> <br><br>
                            <%  
                            } 
                            %>
                            <br>
                            <span> <b class="video"> <%=nombre%></b> </span>
                            <br>
                            <%
                                }
                            %>
                            <br>
                        </div>
		</span>
</body>
</html>