package Forms;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Article;
import Beans.Categorie;
import Beans.Utilisateur;
import DAO.*;
import Metier.Catalogue;
import Metier.LignePanier;
import Metier.Panier;

//@WebServlet("/PasserDAO")
@WebServlet(name = "PasserDAO", loadOnStartup = 1, urlPatterns = { "/index","/panier","/categorie","/authentif1","/authentif2","inscrire" })

public class ControlleurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CONF_DAO_FACTORY = "daofactory";
	private ArticleDao articletDao = null;
	private CategorieDao categorieDao = null;
	private Vector<Categorie> categories = null;
	private Catalogue c = null;
	private String email;
	public ControlleurServlet() {
		super();
	}

	public void init() throws ServletException {

		this.articletDao = ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getArticleDao();
		
		this.categorieDao= ((DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY)).getCategorieDao();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//initialisation de l'objet c de type Catalogue
		try {
			c = new Catalogue(this.articletDao,this.categorieDao);
			//recupere la liste des noms pour les categories
			categories = c.getCategories();
		} catch (SQLException e) { e.printStackTrace(); }
		
		String userPath = request.getServletPath();
		System.out.println(userPath);
		// if index page is requested
		if (userPath.equals("/index")) {
			int page = 1;
			int recordsPerPage = 4;
			if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
			Vector<Article> Articles = null;
			
			int noOfRecords = 0;
			try {
				Articles = c.getArticles((page - 1) * recordsPerPage, recordsPerPage);
				noOfRecords = c.getNoOfRecords();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			request.setAttribute("VecteurArticles", Articles);
			request.setAttribute("vecteurCategories", categories);
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

		} else if (userPath.equals("/panier")) {
			String panVide = "";
			Vector<LignePanier> ArticlesOrdered = new Vector<LignePanier>();
			HttpSession session = request.getSession(true);
			// synchronized (session) { // on r�cup�re les articlesdes commandes
			Panier cart = (Panier) session.getAttribute("Panier");
			panVide = "none";
			if (cart == null) {
				cart = new Panier();
				session.setAttribute("panier", cart);
				panVide = "block";
				request.setAttribute("panVide", panVide);
				this.getServletContext().getRequestDispatcher("/panier.jsp").forward(request, response);
			} else {

				ArticlesOrdered = cart.getArticlesOrdered();
				request.setAttribute("ArticlesOrdered", ArticlesOrdered);
				request.setAttribute("panVide", panVide);
				request.setAttribute("vecteurCategories", categories);
				this.getServletContext().getRequestDispatcher("/panier.jsp").forward(request, response);
			}
			// }

		}else if (userPath.equals("/categorie")) {
			
			Vector<Article> articles= null;
			Catalogue c=null;
			String lib= request.getParameter("categ");
			
			int page = 1;
			int recordsPerPage =2;
			if (request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
			
			int noOfRecords = 0;
			try {
				c= new Catalogue(articletDao, categorieDao);
				articles = c.getArticlesBYcategorie(lib, (page - 1) * recordsPerPage,  recordsPerPage);
				noOfRecords = c.getNoOfRecords();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);
				
				request.setAttribute("libCategorie", lib);
				request.setAttribute("vecteurCategories", categories);
				request.setAttribute("VecteurArticles", articles);
				this.getServletContext().getRequestDispatcher("/categorie.jsp").forward(request, response);
			
			
		}else if (userPath.equals("/authentif1")) {
		
			request.setAttribute("vecteurCategories", categories);
			this.getServletContext().getRequestDispatcher("/authentif.jsp").forward(request, response);
	
		}else if (userPath.equals("/authentif2")) {
				email=request.getParameter("email_create");
				request.setAttribute("vecteurCategories", categories);
				this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward(request, response);
		
		}else if (userPath.equals("/inscrire")) {
			email=request.getParameter("email_create");
			String civilite=request.getParameter("id_gender");
			String firstname=request.getParameter("customer_firstname");
			String lastname=request.getParameter("customer_lastname");
			String password=request.getParameter("passwd");
	
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
