package DAO;

import java.sql.SQLException;

import Beans.Article;
import Beans.Utilisateur;

public interface UtilisateurDao {
	
	public  Utilisateur findUser(String id) throws SQLException;
	public  void AddUser()throws SQLException;

}
