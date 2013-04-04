<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Metier.*"%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Panier</title>
<link href="inc/css/css.css" rel="stylesheet" type="text/css">
<link href="inc/css/global.css" rel="stylesheet" type="text/css"media="all">
<link href="inc/css/style.css" rel="stylesheet" type="text/css"media="all">

<script type="text/javascript" src="inc/js/panier.js"></script>
<script type="text/javascript" src="inc/js/jquery/jquery.js"></script>

</head>
<body id="order">
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


						<!-- Breadcrumb -->
						<div class="breadcrumb bordercolor">
							<div class="breadcrumb_inner">
								<a href="http://livedemo00.template-help.com/prestashop_42350/"
									title="return to Accueil">Accueil</a> <span
									class="navigation-pipe">&gt;</span> <span
									class="navigation_page">Votre panier</span>
							</div>
						</div>
						<!-- /Breadcrumb -->
						<h1 id="cart_title">Récapitulatif de la commande</h1>
						<!-- Steps -->
						<ul id="order_steps" class="step1">
							<li class="step_current"><span>Résumé</span></li>
							<li class="step_todo"><span>Identifiez-vous</span></li>
							<li class="step_todo"><span>Adresse</span></li>
							<li class="step_todo"><span>Frais de port</span></li>
							<li id="step_end" class="step_todo"><span>Paiement</span></li>
						</ul>
						<!-- /Steps -->

						<script type="text/javascript">
							// <![CDATA[
							var currencySign = '$';
							var currencyRate = '1';
							var currencyFormat = '1';
							var currencyBlank = '0';
							var txtProduct = "produit";
							var txtProducts = "produits";
							var deliveryAddress = 0;
							// ]]>
						</script>
					
					
					<c:set var="articlesOrdered" scope="page" value="${ArticlesOrdered}" ></c:set>
					<c:set var="PanVide" scope="page" value="${panVide}" ></c:set>
						
												<c:if test="${not empty articlesOrdered}"> 
												<c:set var="PanVide" scope="page" value="none" ></c:set>
												<p class="p-cart" id="notemptyCartWarning" >
													Votre panier contient <span id="summary_products_quantity"><c:out value="${articlesOrdered.size()}"></c:out>produit</span>
												</p>
												</c:if>
												
												<c:if test="${empty articlesOrdered}"> 
												<c:set var="PanVide" scope="page" value="block" ></c:set>
										
											
						<p style="display:<c:out value="PanVide"></c:out>" id="emptyCartWarning" class="warning">Votre panier est vide.</p>
						</c:if>
<!-- ************ -->			
					<c:if test="${PanVide=='none'}"> 
						<div id="order-detail-content" class="table_block">
							<table id="cart_summary" class="std">
								<thead>
								
									<tr>
										<th class="cart_product first_item">Produit</th>
										<th class="cart_description item">Description</th>
									<!-- 	<th class="cart_ref item">Réf.</th>  -->
										<th class="cart_unit item">Prix unitaire</th>
										<th class="cart_quantity item">Qté</th>
										<th class="cart_total item">Total</th>
									</tr>
								</thead>
								
								<tbody>
								
								<c:forEach items="${articlesOrdered}" var="vecteur" >
									<c:set var="articleId" scope="page" value="${vecteur.getarticle().getArticleID()}" ></c:set>
									<c:set var="shortDesc" scope="page" value="${vecteur.getarticle().getShortDescription()}" ></c:set>
									<c:set var="longDesc" scope="page" value="${vecteur.getarticle().getLongDescription()}" ></c:set>
									<c:set var="prix" scope="page" value="${vecteur.getarticle().getPrix()}" ></c:set>
									<c:set var="imgUrl" scope="page" value="inc/Photos_articles/${vecteur.getarticle().getPhotoRepresentative()}" ></c:set>
									<c:set var="qte" scope="page" value="${vecteur.getNumarticles()}" ></c:set>
									<c:set var="totalLigne" scope="page" value="${vecteur.getTotalCost()}" ></c:set>
									<c:set var="somme" scope="page" value="${totalLigne + somme}"></c:set>
									
							
									<tr id="product_<c:out value="${articleId}"></c:out>" class="last_item  cart_item address_0 odd">
										<td class="cart_product">
										<a href="#">
										<img src="<c:out value="${imgUrl}"></c:out>" width="66" height="66"
												alt="<c:out value="${shortDesc}"></c:out>"></a>
										</td>
										<td class="cart_description">
											<h5>
												<a
													href="#"><c:out value="${longDesc}"></c:out></a>
											</h5>
										</td>
										<!-- <td class="cart_ref">--</td>  -->
										<td class="cart_unit" align="right"><span class="price"
											id="product_price_1_0_0"> 
											<!--  <span style="text-decoration: line-through;">$<c:out value="${prix}"></c:out></span><br>-->
												$<c:out value="${prix}"></c:out>
										</span></td>
										<td class="cart_quantity">
											<div id="cart_quantity_button">
												<a rel="nofollow" class="cart_quantity_up"
													id="cart_quantity_up_1_0_0_0"
													onclick="incrementerQte(<c:out value="${articleId}"></c:out>)" title="Ajouter">
													<img src="inc/img/icon/quantity_up.png" alt="Ajouter"></a> 
													<input size="2" autocomplete="off" class="cart_quantity_input text" value="<c:out value="${qte}"></c:out>" id="quantity_<c:out value="${articleId}"></c:out>" name="quantity_1_0_0_0" type="text"> 
													<a  rel="nofollow" class="cart_quantity_down"
													id="cart_quantity_down_1_0_0_0"
													 onclick="decrementerQte(<c:out value="${articleId}"></c:out>)"  title="Enlever"> <img
													src="inc/img/icon/quantity_down.png" alt="Enlever">
												</a>
											</div> <a rel="nofollow" class="cart_quantity_delete" id="1_0_0_0"
											href="#" onclick="supprimerLignePanier(<c:out value="${articleId}"></c:out>)"><img
												src="inc/img/icon/delete-cart.gif" alt="Supprimer"
												class="icon"></a> <input value="1"
											name="quantity_1_0_0_0_hidden" type="hidden">

										</td>
										<td class="cart_total"><span class="price"
											id="total_product_price_1_0_0"> $<c:out value="${totalLigne}"></c:out> </span></td>
									</tr>
								</c:forEach>
								</tbody>
								<tfoot>
								<!--  
									<tr class="cart_total_price">
										<td colspan="4">Total produits :</td>
										<td colspan="1" class="price" id="total_product">$103.17</td>
									</tr>
								
									<tr class="cart_total_delivery">
										<td colspan="4">Total frais de port :</td>
										<td colspan="1" class="price" id="total_shipping">$0.00</td>
									</tr>
								-->
									<tr class="cart_total_price">
										<td colspan="4">Total :</td>
										<td class="price" id="total_price"><span id="totalPanier" class="price">
												$<c:out value="${somme}"></c:out></span></td>
									</tr>
								</tfoot>
							</table>
						</div>
					
						

						</c:if>
					
					<p class="cart_navigation">
							<!--  -->
								 <a href="index" class="button_large" title="Continuer mes achats">
								 « Continuer mes achats</a>
					
					<c:if test="${PanVide=='none'}"> 
					
								 <a onclick="passerEtapePanier(2)"
								class="exclusive standard-checkout" title="Suivant">Suivant
								»</a>
				</c:if>
						</p>
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