package Metier;

import java.sql.SQLException;
import java.util.*;

import DAO.DAOFactory;

public class Panier {

	private Vector<LignePanier> ArticlesOrdered;
	DAOFactory dao = new DAOFactory("jdbc:mysql://localhost:3306/mydb", "root", "");
	// Creer un panier
	public Panier() {
		ArticlesOrdered = new Vector<LignePanier> ();
	}

	// Retourner le vector qui contient les articles command�s
	public Vector<LignePanier> getArticlesOrdered() {
		return (ArticlesOrdered);
	}

	// Ajouter un article au panier
	public synchronized void addArticle(String ArticleID) throws SQLException {

		LignePanier order;

		/*
		 * on v�rifie si article existe d�j� dans les articles commandes dans ce
		 * cas on *incr�mente seulement la quantit�
		 */

		for (int i = 0; i < ArticlesOrdered.size(); i++) {
			order = (LignePanier) ArticlesOrdered.elementAt(i);
			if (order.getarticleID().equals(ArticleID)) {
				order.incrementNumarticles();
				return;
			}
		}

		// sinon on l'ajoute dans les articles command�s
	
		
		Catalogue c  = new Catalogue(dao.getArticleDao(),dao.getCategorieDao());
		LignePanier newOrder = new LignePanier(c.getArticle(ArticleID));
		ArticlesOrdered.addElement(newOrder);

	}

	// Modifier la quantit� d'un article commande

	public synchronized void setNumOrdered(String ArticleID, int numOrdered) throws SQLException {
		LignePanier order;

		// on cherche l'article passe en param�tre

		for (int i = 0; i < ArticlesOrdered.size(); i++) {
			order = (LignePanier) ArticlesOrdered.elementAt(i);
			System.out.println(order.getarticleID()+"  33333"+numOrdered+"3333333  "+ArticleID);
			if (order.getarticleID().equals(ArticleID)) {
				if (numOrdered <= 0) {
					ArticlesOrdered.removeElementAt(i);
				} else {
					order.setNumarticles(numOrdered);
				}
				return;
			}
			
		}
		Catalogue c  = new Catalogue(dao.getArticleDao(),dao.getCategorieDao());
		LignePanier newOrder = new LignePanier(c.getArticle(ArticleID));
		ArticlesOrdered.addElement(newOrder);
	}

	public synchronized void deleteArticle(String ArticleID){
		for(int i=0;i<ArticlesOrdered.size();i++){
			if(ArticlesOrdered.get(i).getarticleID()==ArticleID){
				ArticlesOrdered.remove(i);
			}
		}
	}
}
