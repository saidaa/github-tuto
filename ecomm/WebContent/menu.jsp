
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="categories_block_left" class="block">
	<h4>Catégories</h4>
	<div class="block_content">
		<ul style="display: block;" class="tree dynamized">
			
			<c:set var="Categories" scope="page" value="${vecteurCategories}"></c:set>


			<c:forEach items="${Categories}" var="Categorie">
				<c:set var="catLib" scope="page"
					value="${Categorie.getLibCategorie()}"></c:set>
				<li><a href="categorie?categ=<c:out value="${catLib}"></c:out> "><c:out value="${catLib}"></c:out></a></li>


			</c:forEach>
			<!--  <a href="/Categorie">aaaaa</a>-->
		</ul>

	</div>
</div>
<!-- /Block categories module -->
<div id="tmpics">
	<ul>
		<li><a href="#"> <img src="inc/img/slides/slide_00.jpg"
				alt="">
		</a></li>
		<li><a href="#"> <img src="inc/img/slide_01_002.jpg" alt="">
		</a></li>
	</ul>
</div>