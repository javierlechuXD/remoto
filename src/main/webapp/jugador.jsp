<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>

<% BDController controladorBD = new BDController();
Integer cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
String tipoCarta = request.getParameter("tipoCarta");
String colorLetra = "#474747";
if (tipoCarta == null){
	tipoCarta = "Simple";
}
if (!tipoCarta.equalsIgnoreCase("Simple")){
	colorLetra = "white";
}
Jugador jugador_uso = controladorBD.dameJugador(cod_jugador);
Carta carta_uso = controladorBD.dameCarta(tipoCarta, jugador_uso.getCod_jugador());
Funciones funciones = new Funciones();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		<%
		
		%>
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
										<table style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<tr style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<td width="100" style="background-color:white; border-color: black;text-align:center; margin:0;padding: 0 0em 0em 0em;"><h2></h2></td>
											</tr>
										</table>
									</header>
							<%
							%>		
							<!-- Grid -->
							<div class="grid-containerGeneral">
							  <div class="c1">
								  <div class="grid-container" style="background-image: url('images/cartas/<%=tipoCarta%>.png');">
									  <div class="A" Style="color:<%=colorLetra%>"><%out.print(carta_uso.getRat()); %></div>
									  <div class="B" Style="color:<%=colorLetra%>"><%out.print(carta_uso.getPos()); %></div>
									  <div class="C"><img width="30" src="<%out.print("./images/paises/" + jugador_uso.getPais() + ".png");%>"></img></div>
									  <div class="D"><img width="30" src="<%out.print("./images/equipos/" + jugador_uso.getCod_equipo() + ".png");%>"></img></div>
									  <div class="E"><img width="100" src="<%out.print("./images/jugadores/" + jugador_uso.getCod_jugador() + ".png");%>"></img></div>
									  <div class="F" Style="color:<%=colorLetra%>"><%out.print(jugador_uso.getNombre()); %></div>
									  <div class="G" style="color:<%=colorLetra%>"><%=carta_uso.getPac()%> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%=carta_uso.getDri()%> DRI<br> 90 SHO   &nbsp;|&nbsp;&nbsp; <%=carta_uso.getDef()%> DEF<br><%=carta_uso.getPas()%> PAS   &nbsp;&nbsp;|&nbsp;&nbsp; <%=carta_uso.getPhy()%> PHY</div>
									 </div>
							  </div>
							  <div class="b">
							  <% 
								
							   %>
								  <div class="grid-container2" >
									  <div class="grid-container2">
										  <div class="a2">PACE</div>
										  <div class="b2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getPac())); %>;"><%out.print(carta_uso.getPac()); %></div>
										  <div class="c2" style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getPac())); %>; width:<%out.print(carta_uso.getPac()); %>%;"></div>
										  
										  <% 
											
										   %>
										  <div class="d2">SHOOTING</div>
										  <div class="e2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getSho())); %>;"><%out.print(carta_uso.getSho()); %></div>
										  <div class="f2"style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getSho())); %>; width:<%out.print(carta_uso.getSho()); %>%;"></div>
										  <% 
											
										   %>
										  
										  <div class="g2">PASSING</div>
										  <div class="h2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getPas())); %>;"><%out.print(carta_uso.getPas()); %></div>
										  <div class="i2" style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getPas())); %>; width:<%out.print(carta_uso.getPas()); %>%;"></div>
										  <% 
											
										   %>
										  <div class="j2">DRIBBLING</div>
										  <div class="k2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getDri())); %>;"><%out.print(carta_uso.getDri()); %></div>
										  <div class="l2" style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getDri())); %>; width:<%out.print(carta_uso.getDri()); %>%;"></div>
										  <% 
											
										   %>
										  <div class="m2">DEFENDING</div>
										  <div class="n2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getDef())); %>;"><%out.print(carta_uso.getDef()); %></div>
										  <div class="o2" style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getDef())); %>; width:<%out.print(carta_uso.getDef()); %>%;"></div>
										  <% 
											
										   %>
										  <div class="p2">PHYSICALITY</div>
										  <div class="q2" style="color:<%out.print(funciones.colorFondoLineas(carta_uso.getPhy())); %>;"><%out.print(carta_uso.getPhy()); %></div>
										  <div class="r2" style="background-color:<%out.print(funciones.colorFondoLineas(carta_uso.getPhy())); %>; width:<%out.print(carta_uso.getPhy()); %>%;"></div>
									</div>
								 </div>
							  </div>
							</div>
							<div class="grid-containerGeneral">
								<div class="c1"  style="padding-left:5px; padding-top:5px;text-align: center;">
									<table style="border-color:white; background-color:white;">
										<tr style="border-color:white; background-color:white;">
										<td style="border-color:white; background-color:white;"><a href="jugador.jsp?cod_jugador=<%out.print(jugador_uso.getCod_jugador()); %>&tipoCarta=Simple"><div class="<%out.print(controladorBD.dameCarta("Simple", carta_uso.getCod_jugador()).getNombre());%>" style="text-align: center;"><%out.print(controladorBD.dameCarta("Simple", carta_uso.getCod_jugador()).getRat()); %></div></a></td>
											<%for (int i = 0; i < controladorBD.dameCartasJugador(jugador_uso.getCod_jugador()).size();i++){	
											%>
												<td style="border-color:white; background-color:white;"><a href="jugador.jsp?cod_jugador=<%out.print(jugador_uso.getCod_jugador()); %>&tipoCarta=<%out.print(controladorBD.dameCartasJugador(jugador_uso.getCod_jugador()).get(i).getNombre());%>"><div class="<%out.print(controladorBD.dameCartasJugador(jugador_uso.getCod_jugador()).get(i).getNombre()); %>" style="text-align: center;"><%out.print(controladorBD.dameCartasJugador(jugador_uso.getCod_jugador()).get(i).getRat());%></div></a></td>
										<%} %>
										</tr>
									</table>
								</div>
								
								<div class="b"></div>
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
									<li><a href="jugadores.asp">Listado de Jugadores</a></li>
									<li><a href="equipos.asp">Listado de Equipos</a></li>
									<li><a href="ligas.asp">Listado de Ligas</a></li>
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Más Opciones</h3>
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
								<li>&copy; FIFA 19. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
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