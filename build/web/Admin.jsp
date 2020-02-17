<%-- 
    Document   : Admin
    Created on : 24/04/2018, 05:51:21 PM
    Author     : javie
--%>

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
	</div>

	<span class="lateral"> 
		<div class="elemento"> Nombre Admin </div>
		<hr>
		<div class="elemento"> Videos Reportados </div>
		<hr>
		 <a href="VerVideo.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Video 1 </div> </a>
		 <a href="VerVideo.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Video 2 </div> </a>
		 <a href="VerVideo.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Video 3 </div> </a>
		<div class="elemento"> Usuarios Bloqueados </div>
		<hr>
		<a href="Perfil.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Usuario 1 </div> </a> 
		<a href="Perfil.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Usuario 2 </div> </a> 
		<a href="Perfil.jsp" > <div class="elemento clickeable"> &nbsp&nbsp Usuario 3 </div> </a> 
	</span>

	<span class="dashboard">
		
		<div class="elemento">  &nbsp&nbsp Videos Denunciados </div> <br>

		<div>
			<div>
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
			</div>
			<div>
				<span> <b class="video"> Video 1 </b> </span>
				<span> <b class="video"> Video 2 </b> </span>
				<span> <b class="video"> Video 3 </b> </span>
				<span> <b class="video"> Video 4 </b> </span>
			</div>
		</div>
		<div>
			<div>
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
			</div>
			<div>
				<span> <b class="video"> Video 5 </b> </span>
				<span> <b class="video"> Video 6 </b> </span>
				<span> <b class="video"> Video 7 </b> </span>
				<span> <b class="video"> Video 8 </b> </span>
			</div>
		</div>
		<div>
			<div>
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.sjp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
				<span> <a href="VerVideo.jsp" class="invisible"> <img src="play.png" class="video clickeable"> </a> </span> 
			</div>
			<div>
				<span> <b class="video"> Video 9 </b> </span>
				<span> <b class="video"> Video 10 </b> </span>
				<span> <b class="video"> Video 11 </b> </span>
				<span> <b class="video"> Video 12 </b> </span>
			</div>
		</div>
	</span>

</body>
</html>