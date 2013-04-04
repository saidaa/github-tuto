//Un article (Article) est d�finit dans cette classe 
package Beans;
import java.util.Vector;

import DAO.*;


public class Utilisateur {
	
	
	private String UtilisateurID;
	private String UtilisateurEmail;
	private String UtilisateurPassword;
	
	public Utilisateur(){
		
	}
	
	public Utilisateur(String utilisateurID, String utilisateurEmail,
			String utilisateurPassword) {
		super();
		UtilisateurID = utilisateurID;
		UtilisateurEmail = utilisateurEmail;
		UtilisateurPassword = utilisateurPassword;
	}
	

	public String getUtilisateurID() {
		return UtilisateurID;
	}
	public void setUtilisateurID(String utilisateurID) {
		UtilisateurID = utilisateurID;
	}
	public String getUtilisateurEmail() {
		return UtilisateurEmail;
	}
	public void setUtilisateurEmail(String utilisateurEmail) {
		UtilisateurEmail = utilisateurEmail;
	}
	public String getUtilisateurPassword() {
		return UtilisateurPassword;
	}
	public void setUtilisateurPassword(String utilisateurPassword) {
		UtilisateurPassword = utilisateurPassword;
	}
	
	
}
