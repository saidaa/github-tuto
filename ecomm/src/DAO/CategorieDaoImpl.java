package DAO;

import static DAO.DAOUtilitaire.fermeturesSilencieuses;
import static DAO.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


import Beans.Categorie;

public class CategorieDaoImpl implements CategorieDao {
	
	private DAOFactory daoFactory;
	private static final String SQL_SELECT_REF  = "Select  * FROM categorie where idCategorie = ? ";
	private static final String SQL_SELECT_LIB  = "Select  * FROM categorie where nomCategorie = ? ";
	private static final String SQL_SELECT_ALL  = "Select  * FROM categorie";
	 
	
	CategorieDaoImpl( DAOFactory daoFactory ) {
	        this.daoFactory = daoFactory;
	}
	public CategorieDaoImpl(){}
	
	public Categorie findByLib(String id) throws SQLException {
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
		Categorie cat = null;
		 try {
	            /* R�cup�ration d'une connexion depuis la Factory */
	            connexion = daoFactory.getConnection();
	            //preparedStatement=connexion.prepareStatement("Select * from article where refArticle="+id);
	            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_LIB, false,id);
	            resultSet = preparedStatement.executeQuery();
	            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
	            while(resultSet.next()){
					cat =new Categorie();
					cat.setIdCategorie(resultSet.getString("idCategorie"));
					cat.setLibCategorie(resultSet.getString("nomCategorie"));
					
				}
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
	        }
		
		
		
		
		return cat;
	}

	public Categorie findById(String id) throws SQLException {
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
		Categorie cat = null;
		 try {
	            /* R�cup�ration d'une connexion depuis la Factory */
	            connexion = daoFactory.getConnection();
	            //preparedStatement=connexion.prepareStatement("Select * from article where refArticle="+id);
	            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_REF, false,id);
	            resultSet = preparedStatement.executeQuery();
	            /* Parcours de la ligne de donn�es de l'�ventuel ResulSet retourn� */
	            while(resultSet.next()){
					cat =new Categorie();
					cat.setIdCategorie(resultSet.getString("idCategorie"));
					cat.setLibCategorie(resultSet.getString("nomCategorie"));
					
				}
	        } catch ( SQLException e ) {
	            throw new DAOException( e );
	        } finally {
	            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
	        }
		
		
		
		
		return cat;
	}
	public Vector<Categorie> getAll() throws SQLException {
		Vector<Categorie> vectCat = new Vector<Categorie>();
		Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            /* R�cup�ration d'une connexion depuis la Factory */
        	connexion = daoFactory.getConnection();
            if(connexion==null) {System.out.println("nuuuuuuuuuuuuul");}
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_ALL,false );
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
            	Categorie c = this.findById(resultSet.getString("idCategorie"));
				vectCat.add(c);
			}
            
           }catch ( SQLException e ) {
            throw new DAOException( e );
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }
		
		
		
		return vectCat;
	}

}
