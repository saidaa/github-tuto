
package Metier;

import java.sql.SQLException;
import java.util.Vector;

import Beans.Article;
import Beans.Categorie;
import DAO.*;

public class Catalogue {
	
	private Vector<Article> articles =new Vector<Article>();
	private Vector<Categorie> categories =new Vector<Categorie>();
	
	ArticleDao articledao ;//= new ArticleDao() ;
	CategorieDao categorieDao;
	int noOfRecords;	
		
		
	public Catalogue(ArticleDao articledao,CategorieDao categorieDao) throws SQLException{
		 this.articledao = articledao;
		 this.categorieDao = categorieDao;
	}

	public Article getArticle(String articleID) throws SQLException {
		//return new ArticleDaoImpl().find(articleID);
		return articledao.find(articleID);
	}
	public Vector<Article> getArticles( int offset,  int noOfRecords ) throws SQLException {
		articles=articledao.getAll(offset,noOfRecords);
		
		this.noOfRecords= articledao.getNoOfRecords();
		return articles;
	}
	public Vector<Article> getArticlesBYcategorie(String lib, int offset,  int noOfRecords ) throws SQLException {
		articles=articledao.getAllBYCategorie(lib, offset, noOfRecords);
		
		this.noOfRecords= articledao.getNoOfRecords();
		return articles;
	}
	
	
	public Vector<Categorie> getCategories() throws SQLException{
		categories=categorieDao.getAll();
		return categories;
		
	}
	public CategorieDao getCategorieDao() {
		return categorieDao;
	}

	public void setCategorieDao(CategorieDao categorieDao) {
		this.categorieDao = categorieDao;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}
	
	public String[] getarticlesIds(){
		String[] ids = null;
		for(int i=0;i<articles.size();i++){
			ids[i]=articles.get(i).getArticleID();
		}
		return ids;
	}
	
	
	public ArticleDao getArticledao() {
		return articledao;
	}

	public void setArticledao(ArticleDao articledao) {
		this.articledao = articledao;
	}
}

