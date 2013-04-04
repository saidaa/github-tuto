//C�est la servlet qui g�re ensemble des commandes qui proviennent des pages du Catalogueue � kidsPagebooks � et � Techpagebooks �,
//il utilise les sessions pour pouvoir associer un panier a chaque utilisateur, et on a synchronis� acc�s en fonction pour 
//�viter que plusieurs thread acc�dent en panier simultan�ment
package Servlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.SQLException;
import java.text.NumberFormat;
import javax.servlet.annotation.WebServlet;

import Metier.*;

@WebServlet(name = "PanierPage", urlPatterns = { "/PanierPage" })
public class PanierPage extends HttpServlet {
	@SuppressWarnings("unused")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Panier cart = null;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		synchronized (session) {
			cart = (Panier) session.getAttribute("Panier");
			// si le panier n'existe pas encore on va le cr�e et on va le mettre
			// dans l'attribut session

			if (cart == null) {
				cart = new Panier();
				session.setAttribute("Panier", cart);
			}

			// String articleID ="lewis001";

			// on r�cup�re l�articleID pass� par M�thode GET

			String articleID = request.getParameter("articleID");
			String recalculTotal = request.getParameter("recalculTotal");
			String recalculNbProduits = request
					.getParameter("recalculNbProduits");

			out.println("<!-- Breadcrumb -->"
					+ "<div class=\"breadcrumb bordercolor\">"
					+ "<div class=\"breadcrumb_inner\"> "
					+ "<a href=\"index.jsp\""
					+ "	title=\"return to Accueil\">Accueil</a> <span"
					+ "	class=\"navigation-pipe\">&gt;</span> <span"
					+ "	class=\"navigation_page\">Votre panier</span>"
					+ "</div>"
					+ "</div>"
					+ "<!-- /Breadcrumb -->"
					+ "<h1 id=\"cart_title\">Récapitulatif de la commande</h1>"
					+ "<!-- Steps -->"
					+ "<ul id=\"order_steps\" class=\"step1\">"
					+ "	<li class=\"step_current\"><span>Résumé</span></li>"
					+ "	<li class=\"step_todo\"><span>Identifiez-vous</span></li>"
					+ "	<li class=\"step_todo\"><span>Adresse</span></li>"
					+ "	<li class=\"step_todo\"><span>Frais de port</span></li>"
					+ "<li id=\"step_end\" class=\"step_todo\"><span>Paiement</span></li>"
					+ "</ul>" + "<!-- /Steps -->");
			if (articleID != null) {
				// r�cup�re la quantit� qui provient de la zone de texte cache
				// pass� par //m�thode Post
				String numarticlesString = request.getParameter("numarticles");
				// String numarticlesString="2";
				if (numarticlesString == null) // si la quantit� �gal null alors
												// article n'existe pas encore
												// //dans panier et on va lui
												// ajouter
				{
					try {
						cart.addArticle(articleID);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else // sinon on modifie la quantit� de l'article commande
				{
					int numarticles;
					try {
						numarticles = Integer.parseInt(numarticlesString);
					} catch (NumberFormatException nfe) {
						numarticles = 0;
					}
					try {
						cart.setNumOrdered(articleID, numarticles);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		session.setAttribute("Panier", cart);
		double Somme = 0;
		String panVide = "";
		Vector<LignePanier> ArticlesOrdered = new Vector<LignePanier>();
		synchronized (session) { // on récupère les articlesdes commandes
			cart = (Panier) session.getAttribute("Panier");
			panVide = "none";
			if (cart == null) {
				panVide = "block";
			} else {
				ArticlesOrdered = cart.getArticlesOrdered();
				if (ArticlesOrdered.size() != 0) {
					panVide = "none";
					out.println("<p class=\"p-cart\" id=\"notemptyCartWarning\" >"
							+ "Votre panier contient <span id=\"summary_products_quantity\">"
							+ ArticlesOrdered.size()
							+ " produit</span>"
							+ "	</p>");
				} else
					panVide = "block";
			}

		}
		out.println("<p style=\"display:"
				+ panVide
				+ "\" id=\"emptyCartWarning\" class=\"warning\">Votre panier est vide.</p>");
		if (panVide == "none") {

			out.println("<div id=\"order-detail-content\" class=\"table_block\">"
					+ "<table id=\"cart_summary\" class=\"std\">"
					+ "	<thead>"

					+ "<tr>"
					+ "<th class=\"cart_product first_item\">Produit</th>"
					+ "<th class=\"cart_description item\">Description</th>"

					+ "<th class=\"cart_unit item\">Prix unitaire</th>"
					+ "<th class=\"cart_quantity item\">Qté</th>"
					+ "<th class=\"cart_total item\">Total</th>"
					+ "</tr>"
					+ "</thead>" + "<tbody>");

			double somme = 0;
			for (int i = 0; i < ArticlesOrdered.size(); i++) {
				String articleId = ArticlesOrdered.get(i).getarticle()
						.getArticleID();
				String shortDesc = ArticlesOrdered.get(i).getarticle()
						.getShortDescription();
				String longDesc = ArticlesOrdered.get(i).getarticle()
						.getLongDescription();
				double prix = ArticlesOrdered.get(i).getarticle().getPrix();
				String imgUrl = "inc/Photos_articles/"
						+ ArticlesOrdered.get(i).getarticle()
								.getPhotoRepresentative();
				int qte = ArticlesOrdered.get(i).getNumarticles();
				double totalLigne = ArticlesOrdered.get(i).getTotalCost();
				somme += totalLigne;
				out.println("<tr id=\"product_"
						+ articleId
						+ "\" class=\"last_item  cart_item address_0 odd\">"
						+ "		<td class=\"cart_product\">"
						+ "		<a href=\"#\">"
						+ "		<img src=\""
						+ imgUrl
						+ "\" width=\"66\" height=\"66\" "
						+ "				alt=\""
						+ shortDesc
						+ "\"></a>"
						+ "		</td>"
						+ "		<td class=\"cart_description\">"
						+ "			<h5>"
						+ "				<a"
						+ "				href=\"#\">"
						+ longDesc
						+ "</a>"
						+ "			</h5>"
						+ "		</td>"
						+ "		<td class=\"cart_unit\" align=\"right\"><span class=\"price\""
						+ "			id=\"product_price_1_0_0\">$"
						+ prix
						+ "</span></td>"
						+ "<td class=\"cart_quantity\">"
						+ "	<div id=\"cart_quantity_button\">"
						+ "		<a rel=\"nofollow\" class=\"cart_quantity_up\""
						+ "			id=\"cart_quantity_up_1_0_0_0\""
						+ "			onclick=\"incrementerQte("
						+ articleId
						+ ")\" title=\"Ajouter\">"
						+ "			<img src=\"inc/img/icon/quantity_up.png\" alt=\"Ajouter\"></a> "
						+ "			<input size=\"2\" class=\"cart_quantity_input text\" value=\""
						+ qte
						+ "\" id=\"quantity_"
						+ articleId
						+ "\" name=\"quantity_1_0_0_0\" type=\"text\">"
						+ "			<a  rel=\"nofollow\" class=\"cart_quantity_down\""
						+ "			id=\"cart_quantity_down_1_0_0_0\""
						+ "			 onclick=\"decrementerQte("
						+ articleId
						+ ")\""
						+ "			title=\"Enlever\"> <img"
						+ "			src=\"inc/img/icon/quantity_down.png\" alt=\"Enlever\">"
						+ "		</a>"
						+ "	</div> <a rel=\"nofollow\" class=\"cart_quantity_delete\" id=\"1_0_0_0\""
						+ "	href=\"#\" onclick=\"supprimerLignePanier("
						+ articleId
						+ ")\"><img"
						+ "		src=\"inc/img/icon/delete-cart.gif\" alt=\"Supprimer\""
						+ "   	class=\"icon\"></a> <input value=\"1\" name=\"quantity_1_0_0_0_hidden\" type=\"hidden\">"

						+ "</td> <td class=\"cart_total\"><span class=\"price\""
						+ "	id=\"total_product_price_1_0_0\"> $" + totalLigne
						+ " </span></td>" + "</tr>");
			}
			out.println("</tbody><tfoot>"
					+ "		<tr class=\"cart_total_price\">"
					+ "				<td colspan=\"4\">Total :</td>"
					+ "				<td class=\"price\" id=\"total_price\"><span id=\"totalPanier\" class=\"price\">"
					+ somme + "</span></td>"
					+ "	</tr> </tfoot> </table> </div>");
		}

		out.println("<p class=\"cart_navigation\">"
				+ "<a href=\"index\" class=\"button_large\" title=\"Continuer mes achats\">"
				+ " « Continuer mes achats </a> ");
		out.print("<a onclick=\"passerEtapePanier(2)\" class=\"exclusive standard-checkout\" title=\"Suivant\">Suivant "
				+ "»</a></p> </div> </div> ");

		// request.setAttribute("Panier", cart);

		// request.getRequestDispatcher("panier.jsp").forward(request,
		// response);

	}

	/** POST and GET requests handled identically. */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
