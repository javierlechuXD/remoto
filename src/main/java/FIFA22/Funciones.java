package FIFA22;

import java.util.ArrayList;

public class Funciones {
	
	public static String tipoCuadrado(Integer num) {
		String clase = "";
		if(num >= 0 && num <= 49){
			clase = "cuadradito_rojo";
		}else if (num >= 50 && num <= 69){
			clase = "cuadradito_naranja";
		}else if (num >= 70 && num <= 79){
			clase = "cuadradito_amarillo";
		}else if (num >= 80 && num <= 89){
			clase = "cuadradito_verde";
		}else if (num >= 90 && num <= 99){
			clase = "cuadradito_verdeoscuro";
		}
		return clase;
	}
	
	public static String colorFondoLineas(Integer num) {
		String fondo = "";
		if(num >= 0 && num <= 49){
			fondo = "#f44336";
		}else if (num >= 50 && num <= 69){
			fondo = "#fb8c00";
		}else if (num >= 70 && num <= 79){
			fondo = "#e9bc0b";
		}else if (num >= 80 && num <= 89){
			fondo = "#4caf50";
		}else if (num >= 90 && num <= 99){
			fondo = "#007e33";
		}
		return fondo;
	}
	
}
