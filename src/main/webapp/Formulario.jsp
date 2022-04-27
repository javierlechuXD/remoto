<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario</title>
</head>
<body>

<h3>Alta de Jugador</h3>
<form action="Operaciones.jsp?tipo=alta_jugador" method="post">
	<input type="text" name="nombre" id="nombre" placeholder="Nombre del jugador">
	<br>
	<input type="number" name="cod_equipo" id="cod_equipo" placeholder="Código Equipo">
	<br>
	<input type="text" name="pierna" id="pierna" placeholder="Pierna del jugador">
	<br>
	<input type="number" name="altura" id="altura" placeholder="Altura del jugador">
	<br>
	<input type="text" name="pais" id="pais" placeholder="País del jugador">
	<br>
	<input type="submit" name="submit" id="submit" value="Dar de Alta jugador">
	<input type="reset"value="Limpar Todo">
</form>

<h3>Baja de Jugador</h3>
<form action="Operaciones.jsp?tipo=baja_jugador" method="post">
	<input type="number" name="cod_jugador" id="cod_jugador" placeholder="Código del jugador">
	<input type="submit" name="submit" id="submit" value="Dar de Baja jugador">
	<input type="reset"value="Limpar Todo">
</form>

<h3>Baja de Equipo</h3>
<form action="Operaciones.jsp?tipo=baja_equipo" method="post">
	<input type="number" name="cod_equipo" id="cod_equipo" placeholder="Código del equipo">
	<input type="submit" name="submit" id="submit" value="Dar de Baja equipo">
	<input type="reset"value="Limpar Todo">
</form>

</body>
</html>