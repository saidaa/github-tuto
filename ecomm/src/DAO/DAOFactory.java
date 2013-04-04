package DAO;

import java.io.*;
import java.sql.*;
import java.util.Properties;
 
public class DAOFactory {
 
    private static final String FICHIER_PROPERTIES       = "DAO/dao.properties";
    private static final String PROPERTY_URL             = "url";
    private static final String PROPERTY_DRIVER          = "driver";
    private static final String PROPERTY_NOM_UTILISATEUR = "nomutilisateur";
    private static final String PROPERTY_MOT_DE_PASSE    = "motdepasse";
 
    private String              url;
    private String              username;
    private String              password;
 
    public DAOFactory( String url, String username, String password ) {
        this.url = url;
        this.username = username;
        this.password = password;
    }
    /*
     * M�thode charg�e de r�cup�rer les informations de connexion � la base de
     * donn�es, charger le driver JDBC et retourner une instance de la Factory
     */
    public static DAOFactory getInstance() throws DAOConfigurationException {
        Properties properties = new Properties();
        String url;
        String driver;
        String nomUtilisateur;
        String motDePasse;
 
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream fichierProperties = classLoader.getResourceAsStream( FICHIER_PROPERTIES );
 
        if ( fichierProperties == null ) {
            throw new DAOConfigurationException( "Le fichier properties " + FICHIER_PROPERTIES + " est introuvable." );
        }
 
        try {
            properties.load( fichierProperties );
           // url = properties.getProperty( PROPERTY_URL );
            url="jdbc:mysql://localhost:3306/mydb";
            //driver = properties.getProperty( PROPERTY_DRIVER );
            driver="com.mysql.jdbc.Driver";
            //nomUtilisateur = properties.getProperty( PROPERTY_NOM_UTILISATEUR );
            //motDePasse = properties.getProperty( PROPERTY_MOT_DE_PASSE );
            nomUtilisateur="root";
            motDePasse="";
        } catch ( IOException e ) {
            throw new DAOConfigurationException( "Impossible de charger le fichier properties " + FICHIER_PROPERTIES, e );
        }
 
        try {
            Class.forName( driver );
        } catch ( ClassNotFoundException e ) {
            throw new DAOConfigurationException( "Le driver est introuvable dans le classpath.", e );
        }
 
        DAOFactory instance = new DAOFactory( url, nomUtilisateur, motDePasse );
        return instance;
    }
 
    /* M�thode charg�e de fournir une connexion � la base de donn�es */
     /* package */ 
     Connection getConnection() throws SQLException {
        return DriverManager.getConnection( url, username, password );
    	 
    }
 
    /*
     * M�thodes de r�cup�ration de l'impl�mentation des diff�rents DAO (un seul
     * pour le moment)
     */
    public ArticleDao getArticleDao() {
        return new ArticleDaoImpl( this );
    }
    public CategorieDao getCategorieDao() {
        return new CategorieDaoImpl( this );
    }
}
