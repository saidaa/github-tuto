package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import Beans.Article;



import static DAO.DAOUtilitaire.*;

public class ArticleDaoImpl implements ArticleDao{
	 private DAOFactory          daoFactory;
	 private int noOfRecords;
	
	 private static final String SQL_SELECT_REF  = "Select SQL_CALC_FOUND_ROWS a.refArticle from article a  limit ? , ?";
	 private static final String SQL_SELECT_NUM_ROWS  = "Select FOUND_ROWS() ";
	 private static final String SQL_SELECT_ALL  = "Select * from article where refArticle=?";
	 private static final String SQL_SELECT_PHOTO= "Select urlPhoto from image where Article_refArticle=? and  representative=1";
	 private static final String SQL_SELECT_PHOTOS= "Select urlPhoto from image where Article_refArticle=? and representative=0";
	 private static final String SQL_SELECT_ALLBYCATEGORIE= "Select SQL_CALC_FOUND_ROWS a.refArticle from article a , categorie c where c.nomCategorie=? and a.Categorie_idCategorie=c.idCategorie limit ? , ?";
	 private static final String SQL_INSERT = "INSERT INTO client (email,nom,motdepasse, prenom,login) VALUES (?,?,?,?,?)";
	 
	 ArticleDaoImpl( DAOFactory daoFactory ) {
	        this.daoFactory = daoFactory;
	    }
	 public ArticleDaoImpl(){
		 
	 }
	 
	 
	
	public Article find(String id) throws SQLException {
		 	Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        Article n = null;
	     
	        try {
	            /* R�cup�ration d'une connexion depuis la Factory */
	            connexion = daoFactory.getConnection();
	            //preparedStatement=connexion.prepareStatement("Select * from article where refArticle="+id);
	            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_ALL, false,id);
	            resultSet = preparedStatement.executeQuery();
	            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
	            while(resultSet.next()){
					n=new Article();
					n.setArticleID(resultSet.getString("refArticle"));
					n.setShortDescription(resultSet.getString("courteDesc"));
					n.setLongDescription(resultSet.getString("longDesc"));
					n.setPrix(resultSet.getDouble("prix"));
					
					n.setPhotoRepresentative(this.getPhotoRepresentative(id));
					n.setPhotos(this.getPhotos(id));
				}
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
	        }
	     
	        return n;
	   
	}
	
	public Vector<Article> getAll(int offset,int noOfRecords) throws SQLException {

		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Vector<Article> articles =new Vector<Article>();
     
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
        	//System.out.println("avnaaaaaaaaaat");
            connexion = daoFactory.getConnection();
            if(connexion==null) {System.out.println("nuuuuuuuuuuuuul");}
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_REF,false, offset,noOfRecords );
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            while(resultSet.next()){
            	Article n= this.find(resultSet.getString("refArticle"));
				articles.add(n);
				
			}
            
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_NUM_ROWS,false );
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next())  {
            	System.out.println( resultSet.getInt(1));
            	this.noOfRecords = resultSet.getInt(1);
            	
            }
            
            
        	}catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }
     
    	return articles;
	}
	
	
	public int getNoOfRecords() {
		return noOfRecords;
	}
	
	public String getPhotoRepresentative(String id) throws SQLException{
		String url="";
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
     
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PHOTO, false,id );
           // preparedStatement=connexion.prepareStatement("Select urlPhoto from image where Article_refArticle="+id+" and representative=1");
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            while(resultSet.next()){
            	url = resultSet.getString("urlPhoto");
			}
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }
    
		return url;
	}
	
	public Vector<String> getPhotos(String id) throws SQLException {
		Vector<String> photos = new Vector<String>();
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
     
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PHOTOS, false,id);
           // preparedStatement=connexion.prepareStatement("Select urlPhoto from image where Article_refArticle="+id+" and representative=0");
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            while(resultSet.next()){
            	photos.add(resultSet.getString("urlPhoto"));
			}
        } catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }
    
		return photos;
	}
	
	public Vector<Article> getAllBYCategorie(String nameCategorie,int offset,int noOfRecords) throws SQLException {
		//
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Vector<Article> articles =new Vector<Article>();
      
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
        	//System.out.println("avnaaaaaaaaaat");
            connexion = daoFactory.getConnection();
            if(connexion==null) {System.out.println("nuuuuuuuuuuuuul");}
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_ALLBYCATEGORIE,false,nameCategorie,offset,noOfRecords);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
            while(resultSet.next()){
            	Article n= this.find(resultSet.getString("refArticle"));
				articles.add(n);
				
			}
            
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_NUM_ROWS,false );
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next())  {
            	this.noOfRecords = resultSet.getInt(1);
            	
            }
            
        	}catch ( SQLException e ) {
        		throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }
     
    	return articles;
	}
	}




