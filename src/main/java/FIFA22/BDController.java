package FIFA22;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

public class BDController {
	private Connection conexion;
	
	public BDController() {
		super();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			this.conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/fifa", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en la conexión a la Bade de Datos - BDController.Contructor_Vacio");
		}
	}

	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}
	
	 //////////////////////////////////////////
	// METODOS DAME - A PARTIR DE UN CÓDIGO //
   //////////////////////////////////////////
	
	public Equipo dameEquipo(int codEquipo) {
		Equipo equipoEncontrado = new Equipo();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_equipo = " + codEquipo + ";");
			if (rs.next()) {
				equipoEncontrado = new Equipo(rs.getInt("cod_equipo"),rs.getString("nombre"),rs.getInt("cod_liga"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameEquipo - BDController");
		}
		return equipoEncontrado;
	}
	
	public ArrayList<Equipo> dameEquiposDeLiga(int codLiga) {
		ArrayList<Equipo> equiposEncontradas = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_liga = " + codLiga + ";");
			while (rs.next()==true) {
				Equipo equipoEncotrnado = new Equipo(rs.getInt("cod_equipo"),rs.getString("nombre"),rs.getInt("cod_liga"));
				equiposEncontradas.add(equipoEncotrnado);			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameEquipo - BDController");
		}
		return equiposEncontradas;
	}
	
	public Jugador dameJugador(int codJugador) {
		Jugador jugadorEncontrado = new Jugador();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where cod_jugador = " + codJugador + ";");
			if (rs.next()) {
				jugadorEncontrado = new Jugador(rs.getInt("cod_jugador"),rs.getString("nombre"),rs.getInt("cod_equipo"),rs.getString("pierna"),rs.getInt("altura"),rs.getString("pais"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameJugador - BDController");
		}
		return jugadorEncontrado;
	}
	
	public ArrayList<Jugador> dameJugadoresDeEquipo(int codEquipo) {
		ArrayList<Jugador> jugadoresEncontrados = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where cod_equipo = " + codEquipo + ";");
			while (rs.next()==true) {
				Jugador jugadorEncontrado = new Jugador(rs.getInt("cod_jugador"),rs.getString("nombre"),rs.getInt("cod_equipo"),rs.getString("pierna"),rs.getInt("altura"),rs.getString("pais"));
				jugadoresEncontrados.add(jugadorEncontrado);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameJugadoresDeEquipo - BDController");
		}
		return jugadoresEncontrados;
	}
	
	public Liga dameLiga(int codLiga) {
		Liga ligaEncontrada = new Liga();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas where cod_liga = " + codLiga + ";");
			if (rs.next()) {
				ligaEncontrada = new Liga(rs.getInt("cod_liga"),rs.getString("nombre"),rs.getString("pais"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameLiga - BDController");
		}
		return ligaEncontrada;
	}
	
	public String damePaisLiga(int codLiga) {
		String pais = "";
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select pais from ligas where cod_liga = " + codLiga + ";");
			if (rs.next()) {
				pais = rs.getString("pais");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameLiga - BDController");
		}
		return pais;
	}
	
	public Carta dameCarta(String nombreCarta, int codJugador) {
		Carta cartaEncontrada = new Carta();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE CONCAT(nombre, cod_jugador) = '" + nombreCarta + String.valueOf(codJugador) + "';");
			if (rs.next()) {
				cartaEncontrada = new Carta(rs.getString("nombre"),rs.getInt("cod_jugador"),rs.getInt("rat"),rs.getString("pos"),rs.getInt("precio"),rs.getInt("pac"),rs.getInt("sho"),rs.getInt("pas"),rs.getInt("dri"),rs.getInt("def"),rs.getInt("phy"),rs.getInt("pierna_mala"),rs.getInt("filigranas"));
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameCartas - BDController");
		}
		return cartaEncontrada;
	}
	
	public ArrayList<Carta> dameCartasJugador(Integer numJugador) {
		ArrayList<Carta> cartasEncontradas = new ArrayList<Carta>();	
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas where cod_jugador =" + numJugador + " and nombre NOT LIKE 'SIMPLE' ;");
			while (rs.next()==true) {
				Carta cartaEncontrada = new Carta(rs.getString("nombre"),rs.getInt("cod_jugador"),rs.getInt("rat"),rs.getString("pos"),rs.getInt("precio"),rs.getInt("pac"),rs.getInt("sho"),rs.getInt("pas"),rs.getInt("dri"),rs.getInt("def"),rs.getInt("phy"),rs.getInt("pierna_mala"),rs.getInt("filigranas"));
				cartasEncontradas.add(cartaEncontrada);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo todasCartas - BDController");
		}
		return cartasEncontradas;
	}
	
	public int dameUltimoCodigoJugador() {
		int codigo = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(cod_jugador) FROM jugadores");
			if (rs.next()) {
				codigo = rs.getInt("MAX(cod_jugador)");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameUltimoCodigoJugador - BDController");
		}
		return codigo;
	}
	
	public int dameUltimoCodigoLiga() {
		int codigo = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(cod_liga) FROM ligas");
			if (rs.next()) {
				codigo = rs.getInt("MAX(cod_liga)");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameUltimoCodigoLiga - BDController");
		}
		return codigo;
	}
	
	public int dameUltimoCodigoEquipo() {
		int codigo = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(cod_equipo) FROM equipos");
			if (rs.next()) {
				codigo = rs.getInt("MAX(cod_equipo)");
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameUltimoCodigoEquipo - BDController");
		}
		return codigo;
	}
	
	 /////////////////////////////////////////////
	// METODOS TODAS - DEVUELVE TODOS LOS ALGO //
   /////////////////////////////////////////////
	
	public ArrayList<Liga> todasLigas() {
		ArrayList<Liga> ligasEncontradas = new ArrayList<Liga>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas;");
			while (rs.next()==true) {
				Liga ligaEncontrada = new Liga(rs.getInt("cod_liga"),rs.getString("nombre"),rs.getString("pais"));
				ligasEncontradas.add(ligaEncontrada);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo todasLigas - BDController");
		}
		return ligasEncontradas;
	}
	
	public ArrayList<Carta> todasCartas() {
		ArrayList<Carta> cartasEncontradas = new ArrayList<Carta>();	
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas;");
			while (rs.next()==true) {
				Carta cartaEncontrada = new Carta(rs.getString("nombre"),rs.getInt("cod_jugador"),rs.getInt("rat"),rs.getString("pos"),rs.getInt("precio"),rs.getInt("pac"),rs.getInt("sho"),rs.getInt("pas"),rs.getInt("dri"),rs.getInt("def"),rs.getInt("phy"),rs.getInt("pierna_mala"),rs.getInt("filigranas"));
				cartasEncontradas.add(cartaEncontrada);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo todasCartas - BDController");
		}
		return cartasEncontradas;
	}
	
	public ArrayList<Jugador> todosJugadores() {
		ArrayList<Jugador> jugadoresEncontrados = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores;");
			while (rs.next()==true) {
				Jugador jugadorEncontrado = new Jugador(rs.getInt("cod_jugador"),rs.getString("nombre"),rs.getInt("cod_equipo"),rs.getString("pierna"),rs.getInt("altura"),rs.getString("pais"));
				jugadoresEncontrados.add(jugadorEncontrado);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo todosJugadores - BDController");
		}
		return jugadoresEncontrados;
	}
	
	public ArrayList<Equipo> todosEquipos() {
		ArrayList<Equipo> equiposEncontrados = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos;");
			while (rs.next()==true) {
				Equipo equipoEncontrado = new Equipo(rs.getInt("cod_equipo"),rs.getString("nombre"),rs.getInt("cod_liga"));
				equiposEncontrados.add(equipoEncontrado);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameEquipo - BDController");
		}
		return equiposEncontrados;
	}
	
	 ///////////////////////////////////////////////////////
	// METODOS EXISTEN - DEVUELVE BOLEAN (TRUE OR FALSE) //
   ///////////////////////////////////////////////////////
	
	public boolean existeEquipo(int codEquipo) {
		boolean equipoEncontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from equipos where cod_equipo = " + codEquipo + ";");
			if (rs.next()) {
				equipoEncontrado = true;
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo existeEquipo - BDController");
		}
		return equipoEncontrado;
	}
	
	public boolean existeJugador(int codJugador) {
		boolean jugadorEncontrado = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from jugadores where cod_jugador = " + codJugador + ";");
			if (rs.next()) {
				jugadorEncontrado = true;
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo existeJugador - BDController");
		}
		return jugadorEncontrado;
	}
	
	public boolean existeLiga(int codLiga) {
		boolean ligaEncontrada = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from ligas where cod_liga = " + codLiga + ";");
			if (rs.next()) {
				ligaEncontrada = true;
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo existeLiga - BDController");
		}
		return ligaEncontrada;
	}
	
	public boolean existeCarta(String nombreCarta, int codJugador) {
		boolean cartaEncontrada = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM cartas WHERE CONCAT(nombre, cod_jugador) = '" + nombreCarta + String.valueOf(codJugador) + "';");
			if (rs.next()) {
				cartaEncontrada = true;			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo existeCarta - BDController");
		}
		return cartaEncontrada;
	}
	
	// Altas
	
	public void darAltaJugador(Jugador jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO `jugadores` (`cod_jugador`, `nombre`, `cod_equipo`, `pierna`, `altura`, `pais`) VALUES ('"+ jugador.getCod_jugador() +"', '"+ jugador.getNombre() +"', '"+ jugador.getCod_equipo() +"', '"+ jugador.getPierna() +"', '"+ jugador.getAltura() +"', '"+ jugador.getPais() +"');");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo darAltaJugador - BDController");
		}
	}
	
	public void darAltaLiga(Liga liga) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO `ligas` (`cod_liga`, `nombre`, `pais`) VALUES ('"+ liga.getCod_liga() +"', '"+ liga.getNombre() +"', '"+ liga.getPais() + "');");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo darAltaLiga - BDController");
		}
	}
	
	public void darAltaEquipo(Equipo equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO `equipos` (`cod_equipo`, `nombre`, `cod_liga`) VALUES ('"+ equipo.getCod_equipo() +"', '"+ equipo.getNombre() +"', '"+ equipo.getCod_liga() + "');");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo darAltaEquipo - BDController");
		}
	}
	
	// Bajas
	
	public void bajaJugador(int codJugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM `jugadores` WHERE `jugadores`.`cod_jugador` = " + codJugador );
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo bajaJugador - BDController");
		}
	}
	
	public void bajaEquipo(int codEquipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM `equipos` WHERE `equipos`.`cod_equipo` = " + codEquipo );
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo bajaEquipo - BDController");
		}
	}
	
	public void bajaLiga(int codLiga) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM `ligas` WHERE `ligas`.`cod_liga` = " + codLiga );
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo bajaEquipo - BDController");
		}
	}
	
	// EDITAR
	public void editarJugador(Jugador jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE `jugadores` SET nombre='" + jugador.getNombre() + "',cod_equipo="+ jugador.getCod_equipo() + ",pierna='"+ jugador.getPierna() + "',altura="+ jugador.getAltura() + ",pais='"+ jugador.getPais() +"'  WHERE `jugadores`.`cod_jugador` = " + jugador.getCod_jugador() +";";
			System.out.println(cadena);
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error bdcontroller editarJugador");
		}
	}
	
	public void editarLiga(Liga liga) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE `ligas` SET nombre='" + liga.getNombre() + "',pais='"+ liga.getPais() + "' WHERE `ligas`.`cod_liga` = " + liga.getCod_liga() +";";
			System.out.println(cadena);
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error bdcontroller editarLiga");
		}
	}
	
	public void editarEquipo(Equipo equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "UPDATE `equipos` SET nombre='"+ equipo.getNombre() + "',cod_liga="+ equipo.getCod_liga() + " WHERE `equipos`.`cod_equipo` = " + equipo.getCod_equipo() +";";
			System.out.println(cadena);
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error bdcontroller editarEquipo");
		}
	}
	
	


}
