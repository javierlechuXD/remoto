<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/dd.css?v=4.0">
    <link rel="stylesheet" type="text/css" href="assets/css/flags.css?v=1.0" />
	<title>Proyecto Web FIFA20</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		<%BDController controladorBD = new BDController();
		ArrayList<Equipo> equipos = controladorBD.todosEquipos();%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">FIFA20</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="jugadores_alu.jsp">FIFA 19 Jugadores</a></li>
										<li><a href="ligas_alu.jsp">FIFA 19 Ligas</a></li>
										<li><a href="equipos_alu.jsp">FIFA 19 Equipos</a></li>
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Jugadores</a>
											<ul>
												<li><a href="altajugador_alu.jsp">Alta Jugador</a></li>
												<li><a href="bajajugador_alu.jsp">Baja Jugador</a></li>
												<li><a href="#">Modificar Jugador</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Equipos</a>
											<ul>
												<li><a href="altaequipo_alu.jsp">Alta Equipo</a></li>
												<li><a href="bajaequipo_alu.jsp">Baja Equipo</a></li>
												<li><a href="#">Modificar Equipo</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Ligas</a>
											<ul>
												<li><a href="altaliga_alu.jsp">Alta Liga</a></li>
												<li><a href="bajaliga_alu.jsp">Baja Liga</a></li>
												<li><a href="#">Modificar Liga</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Cartas</a>
											<ul>
												<li><a href="#">Alta Carta</a></li>
												<li><a href="#">Baja Carta</a></li>
												<li><a href="#">Modificar Carta</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opci??n 1</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>
				<!-- Main -->
				<section class="wrapper style1" style="height:500px;">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									
									<section class="col-6 col-12-narrower">
								<h3>Alta Jugador</h3>
								<form action="Operaciones.jsp?tipo=alta_jugador" method="post">
									<div class="row gtr-50">
										<div class="">
											<input type="text" name="nombre" id="nombre" placeholder="Nombre del jugador" maxlength="9"/>
										</div>
										<div class="">
										
											<select id="cod_equipo" name="cod_equipo" is="ms-dropdown" required style="width:450px" data-child-height="415">
												<option value="">Seleccione un Equipo</option>
												<% for(int i = 0; i<equipos.size();i++){%>
												<option value="<%=equipos.get(i).getCod_equipo()%>" data-image="./images/equipos/<%=equipos.get(i).getCod_equipo()%>.png"><%=equipos.get(i).getNombre()%></option>
												<%}%>
											</select>
										</div>
										<div class="">
											<input type="text" name="pierna" id="pierna" placeholder="Pierna del jugador" maxlength="20"/>
										</div>
										<div class="">
											<input type="number" name="altura" id="altura" placeholder="Altura del jugador" maxlength = "4" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"/>
										</div>
										<div class="">
											<input type="text" name="pais" id="pais" placeholder="Pa??s del jugador" maxlength="10"/>
										</div>
												
									</div>
									
									<div style="padding-top:22px;">
											<ul class="actions">
												<li><input type="submit" name="submit" id="submit" value="Dar de Alta jugador"></li>
												<li><input type="reset"value="Limpar Todo"></li>
											</ul>
									</div>
									
								</form>
							</section>
								</article>
						</div>
					</div>
				</section>
										
			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Jugadores</a></li>
									<li><a href="equipos.asp">Listado de Equipos</a></li>
									<li><a href="ligas.asp">Listado de Ligas</a></li>
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>M??s Opciones</h3>
								<ul class="links">
									<li><a href="altaJugador.jsp">Alta Jugador</a></li>
									<li><a href="altaEquipo.jsp">Alta Equipo</a></li>
									<li><a href="altaLiga.jsp">Alta Liga</a></li>
									<li><a href="altaCarta.jsp">Alta Carta</a></li>
									<li><a href="modifiJugador.jsp">Modificar Jugador</a></li>
									<li><a href="modifiEquipo.jsp">Modificar Equipo</a></li>
									<li><a href="modifiLiga.jsp">Modificar Liga</a></li>
									<li><a href="modifiCarta.jsp">Modificar Carta</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Informaci??n</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 22. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/index.js"></script>
			<script src="assets/js/dropdown.js"></script>
	<script src="assets/js/dd.min.js?ver=4.0"></script>
</body>

</html>