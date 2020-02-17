<%-- 
    Document   : index
    Created on : 24/04/2018, 05:49:08 PM
    Author     : javie
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> BitPlay </title>
	<link rel="stylesheet" type="text/css" href="CSS/Estilo.css">
        
        <script type="text/javascript">

        function AlPerfil () {
        var url = "Perfil.jsp?usuario=<%=session.getAttribute("usuario")%>";
        window.location.href= url;
        }
        
        function Subir () {
        var url = "SubirVideo.jsp";
        window.location.href= url;
        }
        
        </script>
        
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
                      
                      
                    %>          <img class="subevideo enlinea clickeable" src="Images/Subir.png" alt="Pos no" onclick="Subir()">
                                <img class="icono enlinea clickeable" src="data:image/png;base64,<%=session.getAttribute("foto")%>" alt="Pos no" onclick="AlPerfil()">
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
		<div class="elemento clickeable">  &nbsp&nbsp Más Populares </div>
		<div class="elemento clickeable">  &nbsp&nbsp Más Vistos </div>
		<div class="elemento clickeable">  &nbsp&nbsp Más Recientes </div>
	</span>

	<span class="dashboard">
                <%
                    if (session.getAttribute("foto") != null){
                %>
            	<div class="elemento">  &nbsp&nbsp Videos a los que di like </div> <br>
                <%
                    }
                %>
                <div>
			<%
                                Connection con = Conexion.getConexion();
                                if (session.getAttribute("foto") != null){
                                PreparedStatement stmtPopu = null;

                                String queryPopu = "select * from video inner join dalike on video.idVideo = dalike.idVideo where dalike.idUsuario ="+ session.getAttribute("id")+" limit 4";
                                stmtPopu = con.prepareStatement(queryPopu);
                                ResultSet rsPopu = stmtPopu.executeQuery();
                                
                                while(rsPopu.next()){
                                    Blob portada = rsPopu.getBlob("imagen");
                                    byte[] bytesimagen = portada.getBytes(1, (int)portada.length());
                                    String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
                                    int idVideo = rsPopu.getInt("idVideo");
                                
                            %>
                            <span> <a href="VerVideo.jsp?idVideo=<%=idVideo%>&idUsuariotl=<%=session.getAttribute("id") %>" class="invisible"> <img src="data:image/png;base64,<%=ba64%>" class="video clickeable"> </a> </span> 
                                
                            <%
                                }
                            %>
                            <br>
                            <%
                                String query2Popu = "select * from video inner join dalike on video.idVideo = dalike.idVideo where dalike.idUsuario ="+ session.getAttribute("id")+" limit 4";
                                stmtPopu = con.prepareStatement(query2Popu);
                                ResultSet rs2VPopu = stmtPopu.executeQuery();
                                
                                while(rs2VPopu.next()){
                                    String nombre = rs2VPopu.getString("titulo");
                            %>   
                                <span> <b class="video"> <%=nombre%></b> </span>
                            <%
                                }
                            %>
                        </div>
			
			<br><br> 
                        <%
                        }
                        %>
		<div class="elemento">  &nbsp&nbsp Más Vistos </div> <br>
                        <div>
			<%
                                //Connection con = Conexion.getConexion();
                                PreparedStatement stmtVistas = null;

                                String queryVistas = "select * from video order by vistas desc limit 4";
                                stmtVistas = con.prepareStatement(queryVistas);
                                ResultSet rsVistas = stmtVistas.executeQuery();
                                
                                while(rsVistas.next()){
                                    Blob portada = rsVistas.getBlob("imagen");
                                    byte[] bytesimagen = portada.getBytes(1, (int)portada.length());
                                    String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
                                    int idVideo = rsVistas.getInt("idVideo");
                                
                            %>
                            <span> <a href="VerVideo.jsp?idVideo=<%=idVideo%>&idUsuariotl=<%=session.getAttribute("id") %>" class="invisible"> <img src="data:image/png;base64,<%=ba64%>" class="video clickeable"> </a> </span> 
                                
                            <%
                                }
                                String query2Vistas = "select vistas, titulo from video order by vistas desc limit 4";
                                stmtVistas = con.prepareStatement(query2Vistas);
                                ResultSet rs2Vistas = stmtVistas.executeQuery();
                                
                                while(rs2Vistas.next()){
                                    String nombre = rs2Vistas.getString("titulo");
                            %>   
                                <span> <b class="video"> <%=nombre%></b> </span>
                            <%
                                }
                            %>
                        </div>
			<br><br>
		<div class="elemento">  &nbsp&nbsp Más Recientes </div> <br>
			<div>
                            <%
                                //Connection con = Conexion.getConexion();
                                PreparedStatement stmt = null;

                                String query = "select * from video order by idVideo desc limit 4";
                                stmt = con.prepareStatement(query);
                                ResultSet rs = stmt.executeQuery();
                                
                                while(rs.next()){
                                    Blob portada = rs.getBlob("imagen");
                                    byte[] bytesimagen = portada.getBytes(1, (int)portada.length());
                                    String ba64 = Base64.getEncoder().encodeToString(bytesimagen);
                                    int idVideo = rs.getInt("idVideo");
                                
                            %>
                            <span> <a href="VerVideo.jsp?idVideo=<%=idVideo%>&idUsuariotl=<%=session.getAttribute("id") %>" class="invisible"> <img src="data:image/png;base64,<%=ba64%>" class="video clickeable"> </a> </span>                                 
                            <%
                                }
                                String query2 = "select idVideo, titulo from video order by idVideo desc limit 4";
                                stmt = con.prepareStatement(query2);
                                ResultSet rs2 = stmt.executeQuery();
                                
                                while(rs2.next()){
                                    String nombre = rs2.getString("titulo");
                            %>   
                                <span> <b class="video"> <%=nombre%></b> </span>
                            <%
                                }
                            %>
				
			</div>
			<br><br>
	</span>

</body>
</html>
