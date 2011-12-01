 $(document).ready(function() {
 	
 		
       $(".info_perso").load( '/equipe/ajax_contact', {name: $(".info_perso").attr("id")}, function(data){ 
       		$(".info_perso").html( data );
       });

			


 });
	
 
 