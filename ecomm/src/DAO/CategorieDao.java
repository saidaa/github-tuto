package DAO;

import java.sql.SQLException;
import java.util.Vector;

import Beans.Categorie;



public interface CategorieDao {
	
	public  Categorie findByLib(String id) throws SQLException;
	public  Categorie findById(String id) throws SQLException;
	public  Vector<Categorie> getAll() throws SQLException;
}
