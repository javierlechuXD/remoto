<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Página de Origen</title>
</head>
<body>
	<%
	String cadena = "La frase del día";
	int cod_jugador = 35;
	int cod_equipo = 23;
	int cod_liga = 53;
	%>
	<a href="destino.jsp?variable1=<%=cod_jugador%>">Enleace a página destino</a>
	<a href="destino.jsp?cadena=<%=cadena%>&cod_jugador=<%=cod_jugador%>&cod_equipo=<%=cod_equipo%>">Enleace a página destino multiples parámetros</a>

</body>
</html>