<%@page import="javax.sound.midi.Patch"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>

<% Integer cod_equipo = Integer.parseInt(request.getParameter("cod_equipo"));
BDController controladorBD = new BDController();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
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
										<table >
											<tr style="border:0px;" >	
												<td style="background-color: white;"><img width="100" src="<%out.print("./images/equipos/" + cod_equipo + ".png");%>"> </img></td>
											</tr>
											<tr style="border:0px;" >	
												<td style="background-color: white;"><h2><%out.print(controladorBD.dameEquipo(cod_equipo).getNombre());%></h2></td><td style="text-align: right;background-color: white;""></td>
											</tr>
										</table>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Plantilla</th>
											<th width='325' colspan="3"></th>
											<th style="text-align: center;">RAT</th>
											<th style="text-align: center;">POS</th>
											<th style="text-align: center;">CARTA</th>
											<th style="text-align: center;">PRECIO</th>
											<th style="text-align: center;">SKI</th>
											<th style="text-align: center;">WF</th>
											<th style="text-align: center;">PAC</th>
											<th style="text-align: center;">SHO</th>
											<th style="text-align: center;">PAS</th>
											<th style="text-align: center;">DRI</th>
											<th style="text-align: center;">DEF</th>
											<th style="text-align: center;">PHI</th>
											<th style="text-align: center;">ALTURA</th>
										</tr>
									</thead>
									<tbody>
									<% 
										Funciones controladorFunciones = new Funciones(); 
										ArrayList<Jugador> jugadoresBD = controladorBD.dameJugadoresDeEquipo(cod_equipo);
										for (int i = 0; i < jugadoresBD.size(); i++){
										Carta cartaActual = new Carta();
										if (cartaActual.getPos() != null && cartaActual.getPrecio() != 0 && cartaActual.getFiligranas() !=0 && cartaActual.getPierna_mala() !=0 && cartaActual.getPac() != 0){
											Carta cartaSinAtri = new Carta(jugadoresBD.get(i).getNombre(),jugadoresBD.get(i).getCod_jugador());
											cartaActual = cartaSinAtri;
										}else{
											cartaActual = controladorBD.dameCarta("SIMPLE", jugadoresBD.get(i).getCod_jugador());
										}
										
									%>
										<tr>
											<td width='100' rowspan="2"><a href="jugador.jsp?cod_jugador=<%=cartaActual.getCod_jugador()%>" style="border-bottom: none"><img width="100" src="<%out.print("./images/jugadores/" + cartaActual.getCod_jugador()+ ".png"); %>" alt="imagenHtml5"></a></td>
											<td width='325' colspan="3" style="padding-left: 15px;"><a href="jugador.jsp?cod_jugador=<%=cartaActual.getCod_jugador()%>" style="border-bottom: none; font-weight: bold"><%out.print(jugadoresBD.get(i).getNombre()); %></a></td>
											
												
												<td rowspan="2" width='60' style="text-align: center;"><div class="cuadradito_amarillo"><%out.print(cartaActual.getRat()); %></div></td>
											
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(cartaActual.getPos()); %></td>	
												<td rowspan="2" width='100' style="text-align: center;">SIMPLE</td>	
												<td rowspan="2" width='100' style="text-align: center;"><%out.print(cartaActual.getPrecio());%></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(cartaActual.getFiligranas()); %>*</td>	
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(cartaActual.getPierna_mala()); %>*</td>
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getPac()));%>"><%out.print(cartaActual.getPac()); %></div></td>	
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getSho()));%>"><%out.print(cartaActual.getSho()); %></div></td>	
												
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getPas()));%>"><%out.print(cartaActual.getPas()); %></div></td>	
													
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getDri()));%>"><%out.print(cartaActual.getDri()); %></div></td>	
													
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getDef()));%>"><%out.print(cartaActual.getDef()); %></div></td>	
												
												<td rowspan="2" width='60' style="text-align: center;"><div class="<%out.print(controladorFunciones.tipoCuadrado(cartaActual.getPhy()));%>"><%out.print(cartaActual.getPhy()); %></div></td>
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(jugadoresBD.get(i).getAltura()); %> cm</td>
																						
										</tr>
										<tr>
										  <td width='50' style="text-align: center;"><img width="50" src="<%out.print("./images/equipos/" + controladorBD.dameJugador(jugadoresBD.get(i).getCod_jugador()).getCod_equipo()+ ".png"); %>" alt="imagenHtml5"></td>
										  <td width='50' style="text-align: center;"><img width="50" src="<%out.print("./images/paises/" + controladorBD.dameJugador(jugadoresBD.get(i).getCod_jugador()).getPais()+ ".png"); %>" alt="imagenHtml5"></td>
										  <td width='50' style="text-align: center;"><a href="liga.jsp?cod_liga=<%=controladorBD.dameEquipo(controladorBD.dameJugador(jugadoresBD.get(i).getCod_jugador()).getCod_equipo()).getCod_liga()%>" style="border-bottom: none"><img width="50" src="<%out.print("./images/ligas/" + controladorBD.dameEquipo(controladorBD.dameJugador(jugadoresBD.get(i).getCod_jugador()).getCod_equipo()).getCod_liga()+ ".png"); %>" alt="imagenHtml5"></a></td>
										</tr>
										<%
										
										} %>
										
									</tbody>
									
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
								<li>&copy; FIFA 20. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
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