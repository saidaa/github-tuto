<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="Metier.Catalogue"%><%@ page import="java.util.*"%><%@ page import="Beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<title>Authentification</title>
<link href="inc/css/css.css" rel="stylesheet" type="text/css">
<link href="inc/css/global.css" rel="stylesheet" type="text/css" media="all">
<link href="inc/css/style.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="inc/js/authentification.js"></script>
<script type="text/javascript" src="inc/js/jquery/jquery.js"></script>
</head>
<body id="authentication">
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
    <div class="breadcrumb_inner"> <a href="http://livedemo00.template-help.com/prestashop_42350/" title="return to Accueil">Accueil</a> <span class="navigation-pipe">&gt;</span> <span class="navigation_page">Identifiant</span> </div>
  </div>
  <!-- /Breadcrumb -->
 
  <h1>Identifiez-vous</h1>
   <!--
  <script type="text/javascript">
	
	$(document).ready(function(){
		$('#create-account_form').submit(function(){
			submitFunction();
			return false;
		});
		$('#SubmitCreate').click(function(){
			submitFunction();
		});
	});
	function submitFunction()
	{
		$('#create_account_error').html('').hide();
		//send the ajax request to the server
		$.ajax({
			type: 'POST',
			url: baseUri,
			async: true,
			cache: false,
			dataType : "json",
			data: {
				controller: 'authentication',
				SubmitCreate: 1,
				ajax: true,
				email_create: $('#email_create').val(),
				token: token
			},
			success: function(jsonData)
			{
				if (jsonData.hasError)
				{
					var errors = '';
					for(error in jsonData.errors)
						//IE6 bug fix
						if(error != 'indexOf')
							errors += '<li>'+jsonData.errors[error]+'</li>';
					$('#create_account_error').html('<ol>'+errors+'</ol>').show();
				}
				else
				{
					// adding a div to display a transition
					$('#center_column').html('<div id="noSlide">'+$('#center_column').html()+'</div>');
					$('#noSlide').fadeOut('slow', function(){
						$('#noSlide').html(jsonData.page);
						// update the state (when this file is called from AJAX you still need to update the state)
						bindStateInputAndUpdate();
					});
					$('#noSlide').fadeIn('slow');
					document.location = '#account-creation';
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown)
			{
				alert("TECHNICAL ERROR: unable to load form.\n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
			}
		});
	}
	
	</script>
 -->
  <form action="authentif2" method="get" id="create-account_form" class="std">
    <fieldset>
      <h3>Créez votre compte</h3>
      <div class="form_content clearfix">
        <h4>Saisissez votre adresse e-mail pour créer votre compte.</h4>
        <div class="error" id="create_account_error" style="display:none"></div>
        <p class="text">
          <label for="email_create">Adresse e-mail</label>
          <span>
            <input id="email_create" name="email_create" class="account_input" type="text">
          </span> </p>
        <p class="submit">
          <input class="hidden" name="back" value="my-account" type="hidden">
          <input id="SubmitCreate" name="SubmitCreate" class="button_large" value="Créez votre compte" type="submit">
          <input class="hidden" name="SubmitCreate" value="Créez votre compte" type="hidden">
        </p>
      </div>
    </fieldset>
  </form>
  <form action="http://livedemo00.template-help.com/prestashop_42350/index.php?controller=authentication" method="post" id="login_form" class="std">
    <fieldset>
      <h3>Déjà enregistré ?</h3>
      <div class="form_content clearfix">
        <p class="text">
          <label for="email">Adresse e-mail</label>
          <span>
            <input id="email" name="email2" class="account_input" type="text">
          </span> </p>
        <p class="text">
          <label for="passwd">Mot de passe</label>
          <span>
            <input id="passwd" name="passwd" value="" class="account_input" type="password">
          </span> </p>
       <!--  <p class="lost_password"><a href="#">Mot de passe oublié ?</a></p>-->
        <p class="submit">
          <input class="hidden" name="back" value="my-account" type="hidden">
          <input id="SubmitLogin" name="SubmitLogin" class="button" value="Identifiez-vous" type="submit" onclick="#">
        </p>
      </div>
    </fieldset>
  </form>
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