package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Provincia;

public class ProvinciaDAOEC {
	
	public List<Provincia> listarProvincias() {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM provincias ORDER BY nombre");
			
			List<Provincia> listProvincias = new ArrayList<Provincia>();
			while (rs.next()) {
				Provincia provincia = new Provincia(rs.getInt("idprovincia"), rs.getString("nombre"));
				listProvincias.add(provincia);
			}
			
			return listProvincias;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

}
