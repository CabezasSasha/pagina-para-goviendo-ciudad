package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Localidad;

public class LocalidadDAOEC {

	public List<Localidad> listarLocalidades() {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			ResultSet resultSet =  st.executeQuery("SELECT * FROM localidades ORDER BY nombrelocalidad");
			
			List<Localidad> listLocalidades = new ArrayList<Localidad>();
			while(resultSet.next()) {
				Localidad localidad = new Localidad(resultSet.getInt("idlocalidad"), resultSet.getString("nombrelocalidad"));
				listLocalidades.add(localidad);
			}
			
			return listLocalidades;
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}
	
	
	public List<String> listarLocalidadesString() {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			ResultSet resultSet =  st.executeQuery("SELECT * FROM localidades ORDER BY nombrelocalidad");
			
			List<String> listLocalidades = new ArrayList<String>();
			while(resultSet.next()) {
				listLocalidades.add(resultSet.getString("nombrelocalidad"));
			}
			
			return listLocalidades;
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}
	
	public Localidad buscarXID(Integer id) {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection conn = conexionDB.establecerConexion();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM localidades WHERE idlocalidad = " + id);
			
			Localidad localidad = null; 
			if (rs.next()) {
				localidad = new Localidad(
					rs.getInt("idlocalidad"), 
					rs.getString("nombrelocalidad"));
			}
			
			return localidad;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
}
