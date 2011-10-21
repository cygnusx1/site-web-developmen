 $(document).ready(function() {
 	
       $('a[rel=twipsy]').twipsy({'placement': 'below'});
 		
 		
       $(".info_perso").load( '/contact/ajax_contact', {name: $(".info_perso").attr("id")}, function(data){ 
       		$(".info_perso").html( data );
       });

			


 });
	
 
 