function ajouterArticle(idArticle){
	$.ajax({
	      type: "GET",
	      url: "PanierPage",
	      data:"articleID="+idArticle,
	      success: function(msg){
	    }
	    });
	
}



function supprimerLignePanier(idArticle){
	$.ajax({
	      type: "GET",
	      url: "PanierPage",
	      data:"articleID="+idArticle+"&numarticles=0" ,
	      success: function(msg){
	    	  $('#center_column').html("");
	    	  $('#center_column').html(msg);
	     }
	    });
	
}


function incrementerQte(idArticle){
	var qte = new Number($('#quantity_'+idArticle).val())+1;
	if(qte<0) return;
	$('#quantity_'+idArticle).val(qte);
	$.ajax({
	      type: "GET",
	      url: "PanierPage",
	      data:"articleID="+idArticle+"&numarticles="+qte,
	      success: function(msg){
	    	  $('#center_column').html("");
	    	  $('#center_column').html(msg);
	     }
	    });
}




function decrementerQte(idArticle){
	var qte = new Number($('#quantity_'+idArticle).val())-1;
	if(qte<0) return;
	$('#quantity_'+idArticle).val(qte);
	if(qte==0){
		supprimerLignePanier(idArticle);
		recalculTotal();
    	recalculNbProduits();
    	return;
	}
	$.ajax({
	      type: "GET",
	      url: "PanierPage",
	      data:"articleID="+idArticle+"&numarticles="+qte,
	      success: function(msg){
	    	  $('#center_column').html("");
	    	  $('#center_column').html(msg);
	     }
	    });
}


function passerEtapePanier(etape){
	
	$.ajax({
	      type: "GET",
	      url: "PanierEtape2",
	      data:"",
	      success: function(msg){
	    	  $('#center_column').html("");
	    	  $('#center_column').html(msg);
	     }
	    });
}