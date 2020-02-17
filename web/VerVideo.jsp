<%-- 
    Document   : VerVideo
    Created on : 24/04/2018, 06:19:22 PM
    Author     : javie
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>BitPlay</title>
	<link rel="stylesheet" type="text/css" href="CSS/Estilo_1.css">
	<link rel="stylesheet" type="text/css" href="CSS/Estilo_Video.css">
        <script src="JS/jquery.js" type="text/javascript"></script>
        
        <script type="text/javascript">
        function likes(idUsuario,idVideo){
            var parametros = {
                    "idUsuario" : idUsuario,
                    "idVideo" : idVideo
            };    
                   $.ajax({
                    data:  parametros,
                    url:   '${pageContext.request.contextPath}/S_Like',
                    type:  'post',
                    dataType: "json",
                    success:  function (list) {
                            //$("#like").html(list[0] + " likes");
                            if(list =="1"){
                                $("#like").css("background-color", "red");
                            } else {
                                $("#like").css("background-color", "");
                            }
                    }
                });
        } 
        
        function fav(idUsuario,idVideo){
            var parametros = {
                    "idUsuario" : idUsuario,
                    "idVideo" : idVideo
            };    
                   $.ajax({
                    data:  parametros,
                    url:   '${pageContext.request.contextPath}/S_Favoritos',
                    type:  'post',
                    dataType: "json",
                    success:  function (list) {
                            //$("#like").html(list[0] + " likes");
                            if(list =="1"){
                                $("#fav").css("background-color", "red");
                            } else {
                                $("#fav").css("background-color", "");
                            }
                    }
                });
        } 
        
        </script>
</head>
<body>
	<div class="hastaarriba"> 
		<span> <a href="index.jsp"> <img src="Images/Logo.jpg" id="logo"> </a> </span>
		<!--<span class="buscar enlinea"> <input class="buscar enlinea" type="text" placeholder="Buscar"> </span>
		<span> <input type="image" src="Images/buscar.png" class="buscar enlinea"> </span>-->
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

	<span class="fulldashboard">
            
                <%
                                Connection con = Conexion.getConexion();
                                PreparedStatement stmt = null;
                                String idvideo = request.getParameter("idVideo");
                                String query = "select * from video where idVideo = ?;";
                                stmt = con.prepareStatement(query);
                                stmt.setString(1, idvideo);
                                ResultSet rs = stmt.executeQuery();
                                
                                if (rs.next()){
                                String nombre = rs.getString("titulo");
                                String descripcion = rs.getString("descripcion");
                                int idUsuario = rs.getInt("idUsuario");
                                int vistas = rs.getInt("vistas");
                                vistas+=1;
                                Blob foto = rs.getBlob("path");
                                byte[] bytesimagen = foto.getBytes(1, (int)foto.length());
                                String video = Base64.getEncoder().encodeToString(bytesimagen);
                                
                                String queryVistas = "update video set vistas = ? where idVideo = ?;";
                                PreparedStatement stmtVistas = null;
                                stmtVistas = con.prepareStatement(queryVistas);
                                stmtVistas.setInt(1, vistas);
                                stmtVistas.setString(2, idvideo);
                                stmtVistas.execute();
                                
                                String query_2 = "select * from usuario where idUsuario = ?";
                                PreparedStatement stmt2 = null;
                                stmt2 = con.prepareStatement(query_2);
                                stmt2.setInt(1, idUsuario);
                                ResultSet rs2 = stmt2.executeQuery();
                                if(rs2.next()){
                                String nombreUsuario = rs2.getString("usuario");
                                
                %>

		<video type="video/mp4" controls="true"> 
			<source src="data:image/png;base64,<%=video%>" type="video/mp4">
		</video>
		<div class="titulo"> 
			<span class="name"><%=nombre%></span>
			<span class="autor"> <a href="Perfil.jsp?usuaio=<%=nombreUsuario%>"><%=nombreUsuario%></a></span>
                        <%
                        
                        if (session.getAttribute("foto") == null){
                          
                        %>
			<span class="likes"> Likes</span>
                        <%
                        } else {
                            String idUsuarioFav = request.getParameter("idUsuariotl");
                            PreparedStatement stmtFav = null;
                            String queryFav = "select * from favorito where idVideo = ? and idUsuario = ?;";
                            stmtFav = con.prepareStatement(queryFav);
                            stmtFav.setString(1, idvideo);
                            stmtFav.setString(2, idUsuarioFav);
                            ResultSet rsFav = stmtFav.executeQuery();

                            if(rsFav.next()){
                            %>
                        <span> <input type="image" id="fav" src="Images/Fav.png" href="javascript:;" style="background:red;" class="clickeable iconovideo" onclick="fav(<%=session.getAttribute("id")%>,<%=idvideo%>)"> </span>
                            <%
                            
                            } else {
                            %>
                            <span> <input type="image" id="fav" src="Images/Fav.png" href="javascript:;" class="clickeable iconovideo" onclick="fav(<%=session.getAttribute("id")%>,<%=idvideo%>)"> </span>
                            <% 
                            } 

                            String idUsuarioLike = request.getParameter("idUsuariotl");
                            PreparedStatement stmtLike = null;
                            String queryLike = "select * from dalike where idVideo = ? and idUsuario = ?;";
                            stmtLike = con.prepareStatement(queryLike);
                            stmtLike.setString(1, idvideo);
                            stmtLike.setString(2, idUsuarioLike);
                            ResultSet rsLike = stmtLike.executeQuery();

                            if(rsLike.next()){
                            %>
                        <span> <input type="image" id="like" src="Images/Like.png" href="javascript:;" style="background:red;" class="clickeable iconovideo" onclick="likes(<%=session.getAttribute("id")%>,<%=idvideo%>)"> </span>
                            <%
                            
                            } else {
                            %>
                            <span> <input type="image" id="like" src="Images/Like.png" href="javascript:;" class="clickeable iconovideo" onclick="likes(<%=session.getAttribute("id")%>,<%=idvideo%>)"> </span>
                            <% 
                            } 
                        }
                        %>
                        <span class="likes"><%=vistas%> Vistas </span>
		</div>

		<div class="comentarios">
			<div class="elemento"> Comentarios </div>
		</div>

	</span>

	<span class="lateralvideo"> 
			<div class="elemento"> Más de <a href="Perfil.jsp?usuario=<%=nombreUsuario%>"><%=nombreUsuario%></a> </div>
			<div>
				<span> <img src="Images/play.png" class="video clickeable"> </span>
				<span class="saltolinea"> 
				Video1
				Autor Video
				Vistas 
				Likes</span>
			</div>
			<div>
				<span> <img src="Images/play.png" class="video clickeable"> </span>
				<span class="saltolinea"> 
				Video2
				Autor Video
				Vistas 
				Likes</span>
			</div>
			<div>
				<span> <img src="Images/play.png" class="video clickeable"> </span>
				<span class="saltolinea"> 
				Video3
				Autor Video
				Vistas 
				Likes</span>
			</div>
	</span>
                        
                        <%
                            }
                        }
                        %>


</body>
</html>
