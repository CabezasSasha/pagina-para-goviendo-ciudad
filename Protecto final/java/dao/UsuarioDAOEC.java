package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import dataBase.ConexionDB;

public class UsuarioDAOEC {
	

	public Boolean validarUsuYPass(String usuario, String clave) {
		try {
			//crear un objeto conexionDB para poder solicitarle la ejecuci�n de un m�todo
			ConexionDB conexionDB = new ConexionDB();
			//se conexta a la DB
			Connection conn = conexionDB.establecerConexion();
			// establece sesi�n de sql
			Statement st = conn.createStatement();
			// realiza la consulta para verificar si existen usuario y clave
			ResultSet rs = st.executeQuery("SELECT * FROM usuarios where usuario='" + usuario + "' and clave='" + clave + "'");
			
			// rs.next() devuelve true si la consulta anterior largo un resultado
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			//TODO: ssanchez - enviar mail al admin
			e.getStackTrace();
		}
		
		
		return false;
	}
}
