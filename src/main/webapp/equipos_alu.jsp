<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA22</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
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
										<li><a href="creador.jsp">Opción 1</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									<header>
										<h2>Equipos</h2>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Nombre</th>
											<th width='195' colspan="3"></th>
											<th colspan="19">Jugadores</th>
											
										</tr>
									</thead>
									<% BDController controladorBD = new BDController();
										Funciones controladorFunciones = new Funciones(); 
										ArrayList<Equipo> equiposBD = controladorBD.todosEquipos();
										for (int i = 0; i < equiposBD.size(); i++){
								
									%>
									<tbody>
									
										<tr>
											<td width='60' rowspan="2"><a href="equipo.jsp?cod_equipo=<%=equiposBD.get(i).getCod_equipo()%>" style="border-bottom: none"><img width="100" src="<%out.print("./images/equipos/" + equiposBD.get(i).getCod_equipo()+ ".png"); %>" alt="imagenHtml5"></a></td>
											<td width='300' colspan="3" style="padding-left: 15px;"><a href="equipo.jsp?cod_equipo=<%=equiposBD.get(i).getCod_equipo()%>" style="font-weight: bold; border-bottom: none"><%out.print(equiposBD.get(i).getNombre()); %></a></td>
									<% 
										ArrayList<Jugador> jugadoresBD = controladorBD.dameJugadoresDeEquipo(equiposBD.get(i).getCod_equipo());
										for (int j = 0; j < jugadoresBD.size(); j++){
									%>
											<td rowspan="2" width='60' style="text-align: center;"><a href="jugador.jsp?cod_jugador=<%=jugadoresBD.get(j).getCod_jugador()%>" style="border-bottom: none"><img width="100" title="<%out.print(jugadoresBD.get(j).getNombre()); %>" src="<%out.print("./images/jugadores/" + jugadoresBD.get(j).getCod_jugador()+ ".png"); %>" alt="imagenHtml5"></a></td>
									<%} %>
																				
										</tr>
										<tr>
										  <td width='50' style="text-align: center; padding-left: 14px; padding-right: 14px;"><a href="liga.jsp?cod_liga=<%=equiposBD.get(i).getCod_liga() %>" style="border-bottom: none"><img width="50" src="<%out.print("./images/ligas/" + equiposBD.get(i).getCod_liga()+ ".png"); %>" alt="imagenHtml5"></a></td>
										  <td width='50' style="text-align: center; padding-left: 14px;"><img width="50" src="<%out.print("./images/paises/" + controladorBD.damePaisLiga(equiposBD.get(i).getCod_liga())+ ".png"); %>" alt="imagenHtml5"></td>
										  <td width='205'></td>
										</tr>
										
										
									</tbody>
									<%} %>
									
								</table>
							</div>

									
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
									<li><a href="jugadores.asp">Listado de Ligas</a></li>
									
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Más Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opción 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Información</h3>
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
</body>
</html>