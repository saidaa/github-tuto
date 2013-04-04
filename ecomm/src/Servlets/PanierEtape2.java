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

import Beans.Utilisateur;

import Metier.*;

@WebServlet(name = "PanierEtape2", urlPatterns = { "/PanierEtape2" })
public class PanierEtape2 extends HttpServlet {
	

	@SuppressWarnings("unused")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Utilisateur utilisateur = null;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!-- Breadcrumb -->"
				+"<div class=\"breadcrumb bordercolor\">"
				+"<div class=\"breadcrumb_inner\"> "
					+"<a href=\"index.jsp\""
					+"	title=\"return to Accueil\">Accueil</a> <span"
					+"	class=\"navigation-pipe\">&gt;</span> <span"
					+"	class=\"navigation_page\">Votre panier</span>"
				+"</div>"
			+"</div>"
			+"<!-- /Breadcrumb -->"
			+"<h1 id=\"cart_title\">Récapitulatif de la commande</h1>"
			+"<!-- Steps -->"
			+"<ul id=\"order_steps\" class=\"step2\">"
			+"	<li class=\"step_todo\"><span>Résumé</span></li>"
			+"	<li class=\"step_current\"><span>Identifiez-vous</span></li>"
			+"	<li class=\"step_todo\"><span>Adresse</span></li>"
			+"	<li class=\"step_todo\"><span>Frais de port</span></li>"
			+"<li id=\"step_end\" class=\"step_todo\"><span>Paiement</span></li>"
			+"</ul>"
			+"<!-- /Steps -->");
		synchronized (session) { 
			utilisateur = (Utilisateur) session.getAttribute("Utilisateur");
			// si l'utilisateur n'existe pas encore on va rediriger vers la page dithentification
			if (utilisateur == null) {
				out.println("<a href=\"authentif.jsp\"> Veuillez se connecter / creer un nouveau compte  </a>");
			}
			else{
				out.println("<p>Vous etes connécte a votre espace client . <br>Pour  Valider Votre commande cliquer sur suivant</p>");
			}
		}

	}

	/** POST and GET requests handled identically. */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
