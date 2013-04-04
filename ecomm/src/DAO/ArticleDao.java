package DAO;

import java.sql.SQLException;
import java.util.Vector;

import Beans.Article;


public interface ArticleDao {
	
    public  Article find(String id) throws SQLException;
	  
	public  Vector<Article> getAll(int o,int b) throws SQLException;
	
	public Vector<Article> getAllBYCategorie(String nameCategorie,int o,int n) throws SQLException;
	
	public String getPhotoRepresentative(String id) throws SQLException;
	
	public Vector<String> getPhotos(String id) throws SQLException;
	
	public int getNoOfRecords();
	
}
