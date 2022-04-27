<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.io.*,java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA22</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		
		<%
		//variables glovales
		String tipo = request.getParameter("tipo");
		BDController controladorBD = new BDController();	
		String resultadoMostrar = "";
		
		//ALTA JUGADOR
		
		System.out.println(tipo);
		if (tipo.equalsIgnoreCase("alta_jugador")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el código de Equipo", "la pierna", "la altura", "el país"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("cod_equipo"));
			parametros.add(request.getParameter("pierna"));
			parametros.add(request.getParameter("altura"));
			parametros.add(request.getParameter("pais"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}
			if(count == parametros.size()){
				int cod_jugador = controladorBD.dameUltimoCodigoJugador()+1;
				String nombre = request.getParameter("nombre");
				int cod_equipo = Integer.parseInt(request.getParameter("cod_equipo"));
				String pierna = request.getParameter("pierna");
				int altura = Integer.parseInt(request.getParameter("altura"));
				String pais = request.getParameter("pais");
				Jugador jugadorFinal = new Jugador(cod_jugador,nombre,cod_equipo,pierna,altura,pais);
				
				if (controladorBD.existeJugador(jugadorFinal.getCod_jugador()) == false){
					if(controladorBD.existeEquipo(jugadorFinal.getCod_equipo()) == true){
						controladorBD.darAltaJugador(jugadorFinal);
						System.out.println("CORRECTO");
						resultadoMostrar= "El jugador se ha dado de alta correctamente";
					}else{
						resultadoMostrar= "El equipo introducido no existe";
					}

				}else{
					resultadoMostrar= "El jugador introducido ya existe";
				}	
			}
		}
		
		// ALTA LIGA
		
		if (tipo.equalsIgnoreCase("alta_liga")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el pais"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("pais"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}


			if(count == parametros.size()){
				int cod = controladorBD.dameUltimoCodigoLiga()+1;
				Liga ligaCreada = new Liga(cod,request.getParameter("nombre"),request.getParameter("pais"));
				controladorBD.darAltaLiga(ligaCreada);
				resultadoMostrar= "La liga introducido se ha dado de alta correctamente.";
			}
		}
		
		// ALTA EQUIPO
		
		if (tipo.equalsIgnoreCase("alta_equipo")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el código de liga"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("cod_liga"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}


			if(count == parametros.size()){
				int cod_liga = Integer.parseInt(request.getParameter("cod_liga"));
				if(controladorBD.existeLiga(cod_liga)){
					int cod = controladorBD.dameUltimoCodigoEquipo()+1;
					Equipo equipoCreada = new Equipo(cod,request.getParameter("nombre"),cod_liga);
					controladorBD.darAltaEquipo(equipoCreada);
					resultadoMostrar= "El equipo introducido se ha dado de alta correctamente.";
				}else{
					resultadoMostrar= "La liga introducida no existe en la base de datos.";
				}

			}
		}

		// Baja jugador
		if (tipo.equalsIgnoreCase("baja_jugador")){
			int cod_jugador = Integer.parseInt(request.getParameter("cod_jugador")); 
			if(controladorBD.existeJugador(cod_jugador)){
				controladorBD.bajaJugador(cod_jugador);
				resultadoMostrar= "El jugador introducido se ha dado de baja correctamente.";
			}else{
				resultadoMostrar= "El jugador introducido no existe en la base de datos.";
			}
		}

		//Baja equipo
		if (tipo.equalsIgnoreCase("baja_equipo")){
			int cod_equipo = Integer.parseInt(request.getParameter("cod_equipo")); 
			if(controladorBD.existeEquipo(cod_equipo)){
				controladorBD.bajaEquipo(cod_equipo);
				resultadoMostrar= "El equipo introducido se ha dado de baja correctamente.";
			}else{
				resultadoMostrar= "El equipo introducido no existe en la base de datos.";
			}
		}
		
		//Baja liga
		if (tipo.equalsIgnoreCase("baja_liga")){
			int cod_liga = Integer.parseInt(request.getParameter("cod_liga")); 
			if(controladorBD.existeLiga(cod_liga)){
				controladorBD.bajaLiga(cod_liga);
				resultadoMostrar= "La liga introducida se ha dado de baja correctamente.";
			}else{
				resultadoMostrar= "La liga introducida no existe en la base de datos.";
			}
		}
		
		
		//EDITAR JUGADOR
		
		System.out.println(tipo);
		if (tipo.equalsIgnoreCase("editar_jugador")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el código de Equipo", "la pierna", "la altura", "el país"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("cod_equipo"));
			parametros.add(request.getParameter("pierna"));
			parametros.add(request.getParameter("altura"));
			parametros.add(request.getParameter("pais"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}
			if(count == parametros.size()){
				int cod_jugador = Integer.parseInt(request.getParameter("cod_jugador"));
				String nombre = request.getParameter("nombre");
				int cod_equipo = Integer.parseInt(request.getParameter("cod_equipo"));
				String pierna = request.getParameter("pierna");
				int altura = Integer.parseInt(request.getParameter("altura"));
				String pais = request.getParameter("pais");
				Jugador jugadorFinal = new Jugador(cod_jugador,nombre,cod_equipo,pierna,altura,pais);
				
				if (controladorBD.existeJugador(jugadorFinal.getCod_jugador()) == true){
					if(controladorBD.existeEquipo(jugadorFinal.getCod_equipo()) == true){
						controladorBD.editarJugador(jugadorFinal);
						System.out.println("CORRECTO");
						resultadoMostrar= "El jugador se ha editado correctamente";
					}else{
						resultadoMostrar= "El equipo introducido no existe";
					}

				}else{
					resultadoMostrar= "El jugador introducido no existe";
				}	
			}
		}
		
		// EDITAR LIGA
		
			if (tipo.equalsIgnoreCase("editar_liga")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el pais"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("pais"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}


			if(count == parametros.size()){
				int cod = Integer.parseInt(request.getParameter("cod_liga"));
				Liga ligaCreada = new Liga(cod,request.getParameter("nombre"),request.getParameter("pais"));
				controladorBD.editarLiga(ligaCreada);
				resultadoMostrar= "La liga introducido se ha modificado correctamente.";
			}
		}
		// EDITAR EQUIPO
		
		if (tipo.equalsIgnoreCase("editar_equipo")){
			int count = 0;
			ArrayList<String> parametros = new ArrayList<String>();
			ArrayList<String> posParametros = new ArrayList<String>(Arrays.asList("el nombre", "el código de liga"));
			parametros.add(request.getParameter("nombre"));
			parametros.add(request.getParameter("cod_liga"));
			
			for (int i = 0; i < parametros.size(); i++){
				if(parametros.get(i).equalsIgnoreCase("")){
					resultadoMostrar = "Te falta por rellenar " + posParametros.get(i);
					break;
				}else{
					count++;
				}
			}


			if(count == parametros.size()){
				int cod_liga = Integer.parseInt(request.getParameter("cod_liga"));
				if(controladorBD.existeLiga(cod_liga)){
					int cod = Integer.parseInt(request.getParameter("cod_equipo"));
					Equipo equipoCreada = new Equipo(cod,request.getParameter("nombre"),cod_liga);
					controladorBD.editarEquipo(equipoCreada);
					resultadoMostrar= "El equipo introducido se ha modificado correctamente.";
				}else{
					resultadoMostrar= "La liga introducida no existe en la base de datos.";
				}

			}
		}
		
		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA22</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">FIFA 22 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 22 Equipos</a></li>
										<li><a href="jugadores.jsp">FIFA 22 Jugadores</a></li>
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Jugadores</a>
											<ul>
												<li><a href="operaciones.jsp?tipo=altajugador">Alta Jugador</a></li>
												<li><a href="#">Baja Jugador</a></li>
												<li><a href="#">Modificar Jugador</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Equipos</a>
											<ul>
												<li><a href="#">Alta Equipo</a></li>
												<li><a href="#">Baja Equipo</a></li>
												<li><a href="#">Modificar Equipo</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Ligas</a>
											<ul>
												<li><a href="#">Alta Liga</a></li>
												<li><a href="#">Baja Liga</a></li>
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
										<li><a href="#">Construye tu Equipo</a></li>
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
								<h3><%=resultadoMostrar %></h3>
								<img src="./images/cara_feliz.png" width="140px">
								
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

</body>

</html>