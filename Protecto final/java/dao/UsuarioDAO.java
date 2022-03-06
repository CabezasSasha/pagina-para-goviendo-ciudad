package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dataBase.ConexionDB;
import model.Usuario;

public class UsuarioDAO {
	
	public Boolean validarUsuarioYPass(String usuario, String contrasenia) {
		try {
			
			ConexionDB conexionDB = new ConexionDB(); //crea un objeto ConexionDB para conectarse y consultar la DB
			Connection connection = conexionDB.establecerConexion(); //establece la conexi�n con la Db
			Statement statement = connection.createStatement(); //sesi�n
			
			String sql = new String("SELECT * FROM usuarios WHERE usuario = '" + usuario.trim() + "' AND clave ='"+ contrasenia.trim() +"' ");
			
			System.out.println(sql);
			ResultSet resultSet = statement.executeQuery(sql);
			
			//Si resultSet tiene un elemento, resutlSet.next() devuleve true
			if (resultSet.next()) {
				return true;
			}
			
			return false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			
			return false;
		}
	}
	
	public Boolean guardarUsuario(Usuario usuario) {
		try {
			ConexionDB conexionDB = new ConexionDB();
			Connection connection = conexionDB.establecerConexion();
			Statement statement = connection.createStatement();
			
			String sql = new String();
			sql = "INSERT INTO `usuarios`(`usuario`, `clave`) VALUES ( "
					+ "'"+ usuario.getUsuario() + "'," 
					+ "'" + usuario.getClave() + "');";
			
			statement.executeUpdate(sql);
			
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
