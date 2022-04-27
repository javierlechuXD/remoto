package FIFA22;

public class Carta {
	private String nombre;
	private int cod_jugador;
	private int rat;
	private String pos;
	private int precio;
	private int pac;
	private int sho;
	private int pas;
	private int dri;
	private int def;
	private int phy;
	private int pierna_mala;
	private int filigranas;
	
	public Carta() {}
	
	
	public Carta(String nombre, int cod_jugador) {
		super();
		this.nombre = nombre;
		this.cod_jugador = cod_jugador;
	}


	public Carta(String nombre, int cod_jugador, int rat, String pos, int precio, int pac, int sho, int pas, int dri,
			int def, int phy, int pierna_mala, int filigranas) {
		super();
		this.nombre = nombre;
		this.cod_jugador = cod_jugador;
		if (rat >= 0 && rat < 100) {
			this.rat = rat;
		}else {
			System.out.println("ERROR - Los valores de rat introducidos exceden los rangos contemplados (0 - 99)");
			this.rat = 0;
		}
		this.pos = pos;
		this.precio = precio;

		
		if (pac >= 0 && pac < 100) {
			this.pac = pac;
		}else {
			System.out.println("ERROR - Los valores de pac introducidos exceden los rangos contemplados (0 - 99)");
			this.pac = 0;
		}
		
		if (sho >= 0 && sho < 100) {
			this.sho = sho;
		}else {
			System.out.println("ERROR - Los valores de sho introducidos exceden los rangos contemplados (0 - 99)");
			this.sho = 0;
		}
		
		if (pas >= 0 && pas < 100) {
			this.pas = pas;
		}else {
			System.out.println("ERROR - Los valores de pas introducidos exceden los rangos contemplados (0 - 99)");
			this.pas = 0;
		}
		
		if (dri >= 0 && dri < 100) {
			this.dri = dri;
		}else {
			System.out.println("ERROR - Los valores de dri introducidos exceden los rangos contemplados (0 - 99)");
			this.dri = 0;
		}
		
		if (def >= 0 && def < 100) {
			this.def = def;
		}else {
			System.out.println("ERROR - Los valores de def introducidos exceden los rangos contemplados (0 - 99)");
			this.def = 0;
		}
		
		if (phy >= 0 && phy < 100) {
			this.phy = phy;
		}else {
			System.out.println("ERROR - Los valores de phy introducidos exceden los rangos contemplados (0 - 99)");
			this.phy = 0;
		}
		
		if (pierna_mala >= 0 && pierna_mala <= 5) {
			this.pierna_mala = pierna_mala;
		}else {
			System.out.println("ERROR - Los valores de pierna_mala introducidos exceden los rangos contemplados (0 - 5)");
			this.pierna_mala = 0;
		}
		
		if (filigranas >= 0 && filigranas <= 5) {
			this.filigranas = filigranas;
		}else {
			System.out.println("ERROR - Los valores de filigranas introducidos exceden los rangos contemplados (0 - 5)");
			this.filigranas = 0;
		}
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCod_jugador() {
		return cod_jugador;
	}
	public void setCod_jugador(int cod_jugador) {
		this.cod_jugador = cod_jugador;
	}
	public int getRat() {
		return rat;
	}
	public void setRat(int rat) {
		if (rat >= 0 && rat < 100) {
			this.rat = rat;
		}else {
			System.out.println("ERROR - Los valores de rat introducidos exceden los rangos contemplados (0 - 99)");
			this.rat = 0;
		}
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	public int getPac() {
		return pac;
	}
	public void setPac(int pac) {
		if (pac >= 0 && pac < 100) {
			this.pac = pac;
		}else {
			System.out.println("ERROR - Los valores de pac introducidos exceden los rangos contemplados (0 - 99)");
			this.pac = 0;
		}
	}
	public int getSho() {
		return sho;
	}
	public void setSho(int sho) {
		if (sho >= 0 && sho < 100) {
			this.sho = sho;
		}else {
			System.out.println("ERROR - Los valores de sho introducidos exceden los rangos contemplados (0 - 99)");
			this.sho = 0;
		}
	}
	public int getPas() {
		return pas;
	}
	public void setPas(int pas) {
		if (pas >= 0 && pas < 100) {
			this.pas = pas;
		}else {
			System.out.println("ERROR - Los valores de pas introducidos exceden los rangos contemplados (0 - 99)");
			this.pas = 0;
		}
	}
	public int getDri() {
		return dri;
	}
	public void setDri(int dri) {
		if (dri >= 0 && dri < 100) {
			this.dri = dri;
		}else {
			System.out.println("ERROR - Los valores de dri introducidos exceden los rangos contemplados (0 - 99)");
			this.dri = 0;
		}
	}
	public int getDef() {
		return def;
	}
	public void setDef(int def) {
		if (def >= 0 && def < 100) {
			this.def = def;
		}else {
			System.out.println("ERROR - Los valores de def introducidos exceden los rangos contemplados (0 - 99)");
			this.def = 0;
		}
	}
	public int getPhy() {
		return phy;
	}
	public void setPhy(int phy) {
		if (phy >= 0 && phy < 100) {
			this.phy = phy;
		}else {
			System.out.println("ERROR - Los valores de phy introducidos exceden los rangos contemplados (0 - 99)");
			this.phy = 0;
		}
	}
	public int getPierna_mala() {
		return pierna_mala;
	}
	public void setPierna_mala(int pierna_mala) {
		if (pierna_mala >= 0 && pierna_mala <= 5) {
			this.pierna_mala = pierna_mala;
		}else {
			System.out.println("ERROR - Los valores de pierna_mala introducidos exceden los rangos contemplados (0 - 5)");
			this.pierna_mala = 0;
		}
	}
	public int getFiligranas() {
		return filigranas;
	}
	public void setFiligranas(int filigranas) {
		if (filigranas >= 0 && filigranas <= 5) {
			this.filigranas = filigranas;
		}else {
			System.out.println("ERROR - Los valores de filigranas introducidos exceden los rangos contemplados (0 - 5)");
			this.filigranas = 0;
		}
	}

}
