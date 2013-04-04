
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0121)http://livedemo00.template-help.com/prestashop_42350/index.php?controller=authentication&back=my-account#account-creation -->
<html class=" js no-flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms no-csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" lang="fr"><!--<![endif]-->
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Authentification</title>
<link href="inc/css/css.css" rel="stylesheet" type="text/css">
<link href="inc/css/global.css" rel="stylesheet" type="text/css" media="all">
<link href="inc/css/style.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="inc/js/authentification.js"></script>
<script type="text/javascript" src="inc/js/jquery/jquery.js"></script>

</head>
<body id="authentication">
<!--[if lt IE 8]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->
<div id="wrapper1">
<div id="wrapper2">
<div id="wrapper3" class="clearfix">
<header id="header">
	<%@include file="header.jsp"%>
</header>
<div class="columns clearfix">
<aside>
<div id="left_column" class="column">
	<%@include file="menu.jsp"%>
	</div>
</aside>
<div id="center_column" class="center_column"><div id="noSlide" style="display: block;"> 
<div class="breadcrumb bordercolor">
<div class="breadcrumb_inner">
	<a href="http://livedemo00.template-help.com/prestashop_42350/" title="return to Accueil">Accueil</a>
	<span class="navigation-pipe">&gt;</span>
		<span class="navigation_page">Identifiant</span>
				</div>
</div>
<!-- /Breadcrumb -->


<h1>Créez votre compte</h1>


	<!---->
<form action="http://livedemo00.template-help.com/prestashop_42350/index.php?controller=authentication" method="post" id="account-creation_form" class="std">
	
	<fieldset class="account_creation">
		<h3>Vos informations personnelles</h3>
		<p class="radio required">
			<span>Civilité</span>
							<input type="radio" name="id_gender" id="id_gender1" value="1">
				<label for="id_gender1" class="top">Mr</label>
							<input type="radio" name="id_gender" id="id_gender2" value="2">
				<label for="id_gender2" class="top">Mme</label>
							<input type="radio" name="id_gender" id="id_gender3" value="3">
				<label for="id_gender3" class="top">Melle</label>
					</p>
		<p class="required text">
			<label for="customer_firstname">Prénom <sup>*</sup></label>
			<input onKeyUp="$(&#39;#firstname&#39;).val(this.value);" type="text" class="text" id="customer_firstname" name="customer_firstname" value="">
		</p>
		<p class="required text">
			<label for="customer_lastname">Nom <sup>*</sup></label>
			<input onKeyUp="$(&#39;#lastname&#39;).val(this.value);" type="text" class="text" id="customer_lastname" name="customer_lastname" value="">
		</p>
		<p class="required text">
			<label for="email">E-mail <sup>*</sup></label>
			<input type="text" class="text" id="email" name="email" value="">
		</p>
		<p class="required password">
			<label for="passwd">Mot de passe <sup>*</sup></label>
			<input type="password" class="text" name="passwd" id="passwd">
			<span class="form_info">(5 caractères min.)</span>
		</p>
		<p class="select">
			<span>Date de naissance</span>
			<select id="days" name="days">
				<option value="">-</option>
									<option value="1">1&nbsp;&nbsp;</option>
									<option value="2">2&nbsp;&nbsp;</option>
									<option value="3">3&nbsp;&nbsp;</option>
									<option value="4">4&nbsp;&nbsp;</option>
									<option value="5">5&nbsp;&nbsp;</option>
									<option value="6">6&nbsp;&nbsp;</option>
									<option value="7">7&nbsp;&nbsp;</option>
									<option value="8">8&nbsp;&nbsp;</option>
									<option value="9">9&nbsp;&nbsp;</option>
									<option value="10">10&nbsp;&nbsp;</option>
									<option value="11">11&nbsp;&nbsp;</option>
									<option value="12">12&nbsp;&nbsp;</option>
									<option value="13">13&nbsp;&nbsp;</option>
									<option value="14">14&nbsp;&nbsp;</option>
									<option value="15">15&nbsp;&nbsp;</option>
									<option value="16">16&nbsp;&nbsp;</option>
									<option value="17">17&nbsp;&nbsp;</option>
									<option value="18">18&nbsp;&nbsp;</option>
									<option value="19">19&nbsp;&nbsp;</option>
									<option value="20">20&nbsp;&nbsp;</option>
									<option value="21">21&nbsp;&nbsp;</option>
									<option value="22">22&nbsp;&nbsp;</option>
									<option value="23">23&nbsp;&nbsp;</option>
									<option value="24">24&nbsp;&nbsp;</option>
									<option value="25">25&nbsp;&nbsp;</option>
									<option value="26">26&nbsp;&nbsp;</option>
									<option value="27">27&nbsp;&nbsp;</option>
									<option value="28">28&nbsp;&nbsp;</option>
									<option value="29">29&nbsp;&nbsp;</option>
									<option value="30">30&nbsp;&nbsp;</option>
									<option value="31">31&nbsp;&nbsp;</option>
							</select>
			
			<select id="months" name="months">
				<option value="">-</option>
									<option value="1">Janvier&nbsp;</option>
									<option value="2">Février&nbsp;</option>
									<option value="3">Mars&nbsp;</option>
									<option value="4">Avril&nbsp;</option>
									<option value="5">Mai&nbsp;</option>
									<option value="6">Juin&nbsp;</option>
									<option value="7">Juillet&nbsp;</option>
									<option value="8">Août&nbsp;</option>
									<option value="9">Septembre&nbsp;</option>
									<option value="10">Octobre&nbsp;</option>
									<option value="11">Novembre&nbsp;</option>
									<option value="12">Décembre&nbsp;</option>
							</select>
			<select id="years" name="years">
				<option value="">-</option>
									<option value="2013">2013&nbsp;&nbsp;</option>
									<option value="2012">2012&nbsp;&nbsp;</option>
									<option value="2011">2011&nbsp;&nbsp;</option>
									<option value="2010">2010&nbsp;&nbsp;</option>
									<option value="2009">2009&nbsp;&nbsp;</option>
									<option value="2008">2008&nbsp;&nbsp;</option>
									<option value="2007">2007&nbsp;&nbsp;</option>
									<option value="2006">2006&nbsp;&nbsp;</option>
									<option value="2005">2005&nbsp;&nbsp;</option>
									<option value="2004">2004&nbsp;&nbsp;</option>
									<option value="2003">2003&nbsp;&nbsp;</option>
									<option value="2002">2002&nbsp;&nbsp;</option>
									<option value="2001">2001&nbsp;&nbsp;</option>
									<option value="2000">2000&nbsp;&nbsp;</option>
									<option value="1999">1999&nbsp;&nbsp;</option>
									<option value="1998">1998&nbsp;&nbsp;</option>
									<option value="1997">1997&nbsp;&nbsp;</option>
									<option value="1996">1996&nbsp;&nbsp;</option>
									<option value="1995">1995&nbsp;&nbsp;</option>
									<option value="1994">1994&nbsp;&nbsp;</option>
									<option value="1993">1993&nbsp;&nbsp;</option>
									<option value="1992">1992&nbsp;&nbsp;</option>
									<option value="1991">1991&nbsp;&nbsp;</option>
									<option value="1990">1990&nbsp;&nbsp;</option>
									<option value="1989">1989&nbsp;&nbsp;</option>
									<option value="1988">1988&nbsp;&nbsp;</option>
									<option value="1987">1987&nbsp;&nbsp;</option>
									<option value="1986">1986&nbsp;&nbsp;</option>
									<option value="1985">1985&nbsp;&nbsp;</option>
									<option value="1984">1984&nbsp;&nbsp;</option>
									<option value="1983">1983&nbsp;&nbsp;</option>
									<option value="1982">1982&nbsp;&nbsp;</option>
									<option value="1981">1981&nbsp;&nbsp;</option>
									<option value="1980">1980&nbsp;&nbsp;</option>
									<option value="1979">1979&nbsp;&nbsp;</option>
									<option value="1978">1978&nbsp;&nbsp;</option>
									<option value="1977">1977&nbsp;&nbsp;</option>
									<option value="1976">1976&nbsp;&nbsp;</option>
									<option value="1975">1975&nbsp;&nbsp;</option>
									<option value="1974">1974&nbsp;&nbsp;</option>
									<option value="1973">1973&nbsp;&nbsp;</option>
									<option value="1972">1972&nbsp;&nbsp;</option>
									<option value="1971">1971&nbsp;&nbsp;</option>
									<option value="1970">1970&nbsp;&nbsp;</option>
									<option value="1969">1969&nbsp;&nbsp;</option>
									<option value="1968">1968&nbsp;&nbsp;</option>
									<option value="1967">1967&nbsp;&nbsp;</option>
									<option value="1966">1966&nbsp;&nbsp;</option>
									<option value="1965">1965&nbsp;&nbsp;</option>
									<option value="1964">1964&nbsp;&nbsp;</option>
									<option value="1963">1963&nbsp;&nbsp;</option>
									<option value="1962">1962&nbsp;&nbsp;</option>
									<option value="1961">1961&nbsp;&nbsp;</option>
									<option value="1960">1960&nbsp;&nbsp;</option>
									<option value="1959">1959&nbsp;&nbsp;</option>
									<option value="1958">1958&nbsp;&nbsp;</option>
									<option value="1957">1957&nbsp;&nbsp;</option>
									<option value="1956">1956&nbsp;&nbsp;</option>
									<option value="1955">1955&nbsp;&nbsp;</option>
									<option value="1954">1954&nbsp;&nbsp;</option>
									<option value="1953">1953&nbsp;&nbsp;</option>
									<option value="1952">1952&nbsp;&nbsp;</option>
									<option value="1951">1951&nbsp;&nbsp;</option>
									<option value="1950">1950&nbsp;&nbsp;</option>
									<option value="1949">1949&nbsp;&nbsp;</option>
									<option value="1948">1948&nbsp;&nbsp;</option>
									<option value="1947">1947&nbsp;&nbsp;</option>
									<option value="1946">1946&nbsp;&nbsp;</option>
									<option value="1945">1945&nbsp;&nbsp;</option>
									<option value="1944">1944&nbsp;&nbsp;</option>
									<option value="1943">1943&nbsp;&nbsp;</option>
									<option value="1942">1942&nbsp;&nbsp;</option>
									<option value="1941">1941&nbsp;&nbsp;</option>
									<option value="1940">1940&nbsp;&nbsp;</option>
									<option value="1939">1939&nbsp;&nbsp;</option>
									<option value="1938">1938&nbsp;&nbsp;</option>
									<option value="1937">1937&nbsp;&nbsp;</option>
									<option value="1936">1936&nbsp;&nbsp;</option>
									<option value="1935">1935&nbsp;&nbsp;</option>
									<option value="1934">1934&nbsp;&nbsp;</option>
									<option value="1933">1933&nbsp;&nbsp;</option>
									<option value="1932">1932&nbsp;&nbsp;</option>
									<option value="1931">1931&nbsp;&nbsp;</option>
									<option value="1930">1930&nbsp;&nbsp;</option>
									<option value="1929">1929&nbsp;&nbsp;</option>
									<option value="1928">1928&nbsp;&nbsp;</option>
									<option value="1927">1927&nbsp;&nbsp;</option>
									<option value="1926">1926&nbsp;&nbsp;</option>
									<option value="1925">1925&nbsp;&nbsp;</option>
									<option value="1924">1924&nbsp;&nbsp;</option>
									<option value="1923">1923&nbsp;&nbsp;</option>
									<option value="1922">1922&nbsp;&nbsp;</option>
									<option value="1921">1921&nbsp;&nbsp;</option>
									<option value="1920">1920&nbsp;&nbsp;</option>
									<option value="1919">1919&nbsp;&nbsp;</option>
									<option value="1918">1918&nbsp;&nbsp;</option>
									<option value="1917">1917&nbsp;&nbsp;</option>
									<option value="1916">1916&nbsp;&nbsp;</option>
									<option value="1915">1915&nbsp;&nbsp;</option>
									<option value="1914">1914&nbsp;&nbsp;</option>
									<option value="1913">1913&nbsp;&nbsp;</option>
									<option value="1912">1912&nbsp;&nbsp;</option>
									<option value="1911">1911&nbsp;&nbsp;</option>
									<option value="1910">1910&nbsp;&nbsp;</option>
									<option value="1909">1909&nbsp;&nbsp;</option>
									<option value="1908">1908&nbsp;&nbsp;</option>
									<option value="1907">1907&nbsp;&nbsp;</option>
									<option value="1906">1906&nbsp;&nbsp;</option>
									<option value="1905">1905&nbsp;&nbsp;</option>
									<option value="1904">1904&nbsp;&nbsp;</option>
									<option value="1903">1903&nbsp;&nbsp;</option>
									<option value="1902">1902&nbsp;&nbsp;</option>
									<option value="1901">1901&nbsp;&nbsp;</option>
									<option value="1900">1900&nbsp;&nbsp;</option>
							</select>
		</p>
			</fieldset>
			
	<p class="cart_navigation required submit">
		<input type="hidden" name="email_create" value="1">
		<input type="hidden" name="is_new_customer" value="1">
				<input type="submit" name="submitAccount" id="submitAccount" value="S&#39;inscrire" class="exclusive">
		<span><sup>*</sup>Champs requis</span>
	</p>

</form>
</div></div>
</div>
</div>
<footer>
<div id="footer" class="clearfix">
<%@include file="footer.jsp"%>
</div>
</footer>
</div>
</div>




­<style>@font-face {font-family:"font";src:url("https://")}@media (touch-enabled),(-webkit-touch-enabled),(-moz-touch-enabled),(-o-touch-enabled),(-ms-touch-enabled),(modernizr){#touch{top:9px;position:absolute}}@media (transform-3d),(-webkit-transform-3d),(-moz-transform-3d),(-o-transform-3d),(-ms-transform-3d),(modernizr){#csstransforms3d{left:9px;position:absolute;height:3px;}}#generatedcontent:after{content:":)";visibility:hidden}</style><script type="text/javascript" data-rocketsrc="http://d1ros97qkrwjf5.cloudfront.net/42/eum/rum.js" data-rocketoptimized="true"></script><script type="text/javascript" data-rocketsrc="http://beacon-1.newrelic.com/1/72d7dcce33?a=1388850&amp;be=7457&amp;qt=0&amp;ap=5530&amp;dc=190&amp;fe=251&amp;to=ZV1TZ0FTVkFVWkwKXlwXZEFaHRIdXVdcBkkcSFlD&amp;tt=6195dea346e95a03&amp;tk=f3a0d4ea2e0598a3&amp;v=40&amp;jsonp=NREUM.setToken&amp;perf=%7B%22timing%22%3A%7B%22of%22%3A1364146690932%2C%20%22n%22%3A0%2C%20%22u%22%3A6938%2C%20%22ue%22%3A6938%2C%20%22dl%22%3A6941%2C%20%22di%22%3A7014%2C%20%22ds%22%3A7015%2C%20%22de%22%3A7015%2C%20%22dc%22%3A7444%2C%20%22l%22%3A7444%2C%20%22le%22%3A7444%2C%20%22r%22%3A0%2C%20%22re%22%3A448%2C%20%22f%22%3A448%2C%20%22dn%22%3A448%2C%20%22dne%22%3A448%2C%20%22c%22%3A448%2C%20%22ce%22%3A448%2C%20%22rq%22%3A20641%2C%20%22rp%22%3A27129%2C%20%22rpe%22%3A7008%7D%2C%20%22navigation%22%3A%7B%22rc%22%3A1%7D%7D" data-rocketoptimized="true"></script></body></html>