<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<a id="header_logo" href="#" title="Smart"><img class="logo" src="inc/img/logo.jpg" alt="Smart"></a>
	<!-- Block languages module --><!-- /Block languages module --><!-- Block currencies module --><!-- /Block currencies module -->
<!-- block seach mobile -->
<!-- Block search module TOP -->
<div id="search_block_top">
	<form method="get" action="http://livedemo00.template-help.com/prestashop_42350/index.php?controller=search" id="searchbox">
		<label for="search_query_top">Rechercher</label>
		<input name="controller" value="search" type="hidden">
		<input name="orderby" value="position" type="hidden">
		<input name="orderway" value="desc" type="hidden">
		<input autocomplete="off" class="search_query ac_input" id="search_query_top" name="search_query" value="Rechercher" onfocus="if(this.value=='Rechercher')this.value='';" onblur="if(this.value=='')this.value='Rechercher';" type="text">
		<a href="#">Rechercher</a>
	</form>
</div>
	
<!-- /Block search module TOP --><ul id="tmheaderlinks">
<li id="your_account"><a href="#" title="Your Account">Votre compte</a></li>
	<li><a href="index" class="active">accueil</a></li>
	<!--<li><a href="http://livedemo00.template-help.com/prestashop_42350/index.php?controller=cms?id_cms=1">livraison</a></li>-->
    <li><a href="#">promotions</a></li>
	<li class="last"><a href="#">contact</a></li>
</ul><!-- Block user information module HEADER -->
<ul id="header_user">
		<li id="shopping_cart">
		<a href="panier" title="Votre panier d'achat"><b>Panier :</b>
		<span style="display: none;" class="ajax_cart_quantity hidden">0</span>
		<span style="display: none;" class="ajax_cart_product_txt hidden">produit</span>
		<span style="display: none;" class="ajax_cart_product_txt_s hidden">produits</span>
		<span class="ajax_cart_no_product">(vide)</span>
		</a>
	</li>
		<li id="user_info">
		Bienvenue
					(&nbsp;<a class="login" href="authentif1">Identifiez-vous</a>&nbsp;)
			</li>
</ul>

<!-- MODULE Block cart -->
<div id="cart_block">
	<h4>
		<a href="#">Panier</a>
	</h4>
	<div class="block_content">

	<!-- block list of products -->
	<div id="cart_block_list" class="expanded">
			<p id="cart_block_no_products">Aucun produit</p>
				<div class="cart-prices">
			<div class="cart-prices-block">
	<span id="cart_block_shipping_cost" class="price ajax_cart_shipping_cost">$0.00</span>
			<span>Expédition</span>
			</div>
									<div class="cart-prices-block">
				<span id="cart_block_total" class="price ajax_block_cart_total">$0.00</span>
			<span>Total</span>
			</div>
		</div>
				<p id="cart-buttons">
			<a href="#" class="button_mini" title="Panier">Panier</a>			<a href="#" id="button_order_cart" class="exclusive" title="Commander"><span></span>Commander</a>
		</p>
	</div>
	</div>
</div>
<!-- /MODULE Block cart -->