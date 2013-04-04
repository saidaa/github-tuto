<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="Metier.*"%><%@ page import="DAO.*"%>
	<%@ page import="java.util.*"%><%@ page import="Beans.*"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Acceuil</title>
<link href="inc/css/css.css" rel="stylesheet" type="text/css">
<link href="inc/css/global.css" rel="stylesheet" type="text/css"
	media="all">
<link href="inc/css/style.css" rel="stylesheet" type="text/css"
	media="all">
<script type="text/javascript" src="inc/js/panier.js"></script>
<script type="text/javascript" src="inc/js/jquery/jquery.js"></script>
</head>
<body id="index">
	<div id="wrapper1">
		<div id="wrapper2">
			<div id="wrapper3" class="clearfix">

				<header id="header"> <%@include file="header.jsp"%>
				</header>

				<div class="columns clearfix">

					<aside>
					<div id="left_column" class="column">
						<!-- Block categories module -->
						<%@include file="menu.jsp"%>
						<!-- MODULE Block specials -->
						<!-- /MODULE Block specials -->
					</div>
					</aside>

					<div id="center_column" class="center_column">
						

						
						<!-- MODULE Home Featured Products -->
						<c:set var="catlibelle" scope="page" value="${libCategorie}"></c:set>
						<div id="featured_products" class="block">
							<h4><c:out value="${catlibelle}"></c:out></h4>
							<c:set var="Articles" scope="page" value="${VecteurArticles}"></c:set>
							
							<!--   On vÃ©rifie si il nây a pas dâarticle on envoie une erreur -->
							<c:if test="${empty Articles}"> <p> Aucun article </p> </c:if>
							
							<c:if test="${not empty Articles}"> 
								
								<div class="block_content">
								<ul>
								<c:forEach items="${Articles}" var="Article" >
									
									
									<c:set var="articleId" scope="page" value="${Article.getArticleID() }" ></c:set>
									<c:set var="shortDesc" scope="page" value="${Article.getShortDescription() }" ></c:set>
									<c:set var="prix" scope="page" value="${Article.getPrix() }" ></c:set>
									<c:set var="imgUrl" scope="page" value="inc/Photos_articles/${Article.getPhotoRepresentative()}" ></c:set>
									<form method="get" action="PanierPage">
									
									<li class="ajax_block_product">
										<a class="product_image" href="#" title="robe"><img width="170px" height="230px"
											src="<c:out value="${imgUrl}"></c:out>"
											alt="<c:out value="${imgUrl}"></c:out>"></a>
											
										<div>

											<span class="price"><c:out value="${prix}"></c:out></span>
											<!--  <span class="price-discount">$128.96</span>-->
											 <span class="sale"></span>
											<h5>
												<a class="product_link" href=""
													title="<c:out value="${shortDesc}"></c:out>"><c:out value="${shortDesc}"></c:out>.</a>
											</h5>
											<input type="hidden" name="articleID" value=<c:out value="${articleId}"></c:out> />
											<input type="hidden" name="numarticles"  />
											
											<a onclick="ajouterArticle(<c:out value="${articleId}"></c:out>)" class="exclusive ajax_add_to_cart_button" rel="ajax_id_product_1" title="Ajouter au panier">
												Ajouter au panier<span class="add-plus"></span>
											</a>
										</div>
										
									</li>
									</form>
									
									</c:forEach>
									
								</ul>
							</div>
							
							
							
							
							</c:if>
						</div>
					 <table border="1" cellpadding="5" cellspacing="5">
					        <tr>
					    <c:if test="${currentPage != 1}">
					        <td><a href="categorie?page=${currentPage - 1}&categ=${libCategorie}">Previous</a></td><td>&nbsp;&nbsp;</td>
					    </c:if>
					 
					    <%--For displaying Page numbers.
					    The when condition does not display a link for the current page--%>
					    
					            <c:forEach begin="1" end="${noOfPages}" var="i">
					                <c:choose>
					                    <c:when test="${currentPage eq i}">
					                        <td>${i}</td>
					                    </c:when>
					                    <c:otherwise>
					                        <td><a href="categorie?page=${i}&categ=${libCategorie}">${i}</a></td>
					                    </c:otherwise>
					                </c:choose>
					            </c:forEach>
					       
					 
					    <%--For displaying Next link --%>
					    <c:if test="${currentPage lt noOfPages}">
					       <td>&nbsp;&nbsp;</td> <td><a href="categorie?page=${currentPage + 1}&categ=${libCategorie}">Next</a></td>
					    </c:if>
					     </tr>
					    </table>
						
					</div>
              		
				</div>

			</div>

			<footer>
			<div id="footer" class="clearfix">
				<%@include file="footer.jsp"%>
			</div>
			</footer>

		</div>
	</div>
</body>
</html>