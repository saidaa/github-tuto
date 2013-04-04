package DAO;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.Statement;


public class Database {
	
	private String name="mydb";
	private String host="localhost";
	private String user="root";
	private String pwd="";
	public static final int ODBC=0;
	public static final int MYSQL=1;
	
	public static String ODBCbridge="JDBC:ODBC:";
	public static String ODBCdriver="sun.jdbc;odbc;JdbcOdbcDriver";
	public static String Mysqlbridge="jdbc:mysql:";
	public static String Mysqldriver="com.mysql.jdbc.Driver";
	
	public String bridge, driver;
	
	private Connection db;
	private DatabaseMetaData dbm;
	
	public Database(int type){
		switch(type){
		case ODBC:bridge=ODBCbridge;
		          driver=ODBCdriver;
		          break;
		case MYSQL:bridge=Mysqlbridge;
		           driver=Mysqldriver;
		           break;
		}
	}
	public Connection getConnection(){return db;}
	public Connection open(){
		//String url=bridge+"//"+host+"/"+name;
		
		String url="jdbc:mysql://localhost:3306/"+name;
		try{
			Class.forName(driver);
			db=DriverManager.getConnection(url, user, pwd);
			dbm=db.getMetaData();
		}
		catch(Exception e){
			System.out.println("Erreur: "+e.getMessage());
		}
		return db;
	}
	
	public void executeUpdate(String query){
		try{
			Statement st=db.createStatement();
			st.executeUpdate(query);
		}
		catch(Exception e){
			System.out.println("Erreur"+e.getMessage());
		}
	}
	
	public void close(){
		try{
			db.close();
		}
		catch(Exception e){}
	}
}
