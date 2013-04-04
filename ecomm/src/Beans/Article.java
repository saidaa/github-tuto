//Un article (Article) est d�finit dans cette classe 
package Beans;
import java.util.Vector;

import DAO.*;



public class Article{
	/*
	 * Article est identifi� par ID et courte description ainsi une longue
	 * description etun prix
	 */
	private String ArticleID;
	private String shortDescription;
	private String longDescription;
	private double prix;
	private String photoRepresentative;
	private Vector<String> photos;
	
	public Article(){}
	
	public String getArticleID() {
		return ArticleID;
	}
	
	public void setArticleID(String articleID) {
		ArticleID = articleID;
	}
	
	public String getShortDescription() {
		return shortDescription;
	}
	
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	
	public String getLongDescription() {
		return longDescription;
	}
	
	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}
	
	public double getPrix() {
		return prix;
	}
	
	public void setPrix(double prix) {
		this.prix = prix;
	}
	
	public String getPhotoRepresentative() {
		return photoRepresentative;
	}
	
	public void setPhotoRepresentative(String photoRepresentative) {
		this.photoRepresentative = photoRepresentative;
	}
	
	public Vector<String> getPhotos() {
		return photos;
	}
	
	public void setPhotos(Vector<String> photos) {
		this.photos = photos;
	}
}
