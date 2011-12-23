 $(document).ready(function() {
 	
       $(".info_perso").load( '/' + $("#locale").val() + '/equipe/ajax_contact', {name: $(".info_perso").attr("id")}, function(data){ 
       		$(".info_perso").html( data );
       });

			


 });
	
 
 