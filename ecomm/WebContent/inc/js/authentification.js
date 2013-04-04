function connectionUtilisateur(){
	mail=$('#email').val();
	password=$('#passwd').val();
	$.ajax({
	      type: "GET",
	      url: "Authentification",
	      data:"mail="+mail+"&password="+password,
	      success: function(msg){
	    	alert(msg);
	     }
	    });
	
}

function authentifEtape2(){
	
	$.ajax({
	      type: "GET",
	      url: "authentif2",
	      data:"",
	      success: function(msg){
	    	  $('#center_column').html("");
	    	  $('#center_column').html(msg);
	     }
	    });
}