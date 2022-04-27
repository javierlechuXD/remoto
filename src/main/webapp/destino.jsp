<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="FIFA22.*" %>
	<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página de Destino</title>
</head>
<body>

<% String cod_jugador = request.getParameter("variable1"); 

BDController controladorBD = new BDController();
Jugador player = controladorBD.dameJugador(Integer.parseInt(cod_jugador));

%>

<h2>${param.variable1}</h2>
	
</body>
</html>