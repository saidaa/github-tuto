//Cette classe repr�sente les articles que le client a choisi de mettre dans son panier, il contient un article � article � 
//et le � numarticles � qui repr�sente la quantit� commande de cet article.
package Metier;

import Beans.Article;

public class LignePanier {

	private Article article;
	private int numarticles;

	public LignePanier(Article article) {
		setarticle(article);
		setNumarticles(1);
	}

	public Article getarticle() {
		return (article);
	}

	protected void setarticle(Article article) {
		this.article = article;
	}

	// Getters et Setters font appels a les getters de la classe article
	public String getarticleID() {
		return (getarticle().getArticleID());
	}

	public String getShortDescription() {
		return (getarticle().getShortDescription());
	}

	public String getLongDescription() {
		return (getarticle().getLongDescription());
	}

	public double getUnitCost() {
		return (getarticle().getPrix());
	}

	public int getNumarticles() {
		return (numarticles);
	}

	public void setNumarticles(int n) {
		this.numarticles = n;
	}

	public void incrementNumarticles() {
		setNumarticles(getNumarticles() + 1);
	}

	public void cancelOrder() {
		setNumarticles(0);
	}

	// Calculer le prix total de cet article
	public double getTotalCost() {
		return (getNumarticles() * getUnitCost());
	}
}
