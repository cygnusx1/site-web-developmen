$(document).ready(function() {

	$(".ajaxtwitter").load('/home/ajax_twitter',$("#locale"), function(data) {
		$(".ajaxtwitter").html(data);
	});

	$('#carousel').infiniteCarousel({
		transitionSpeed : 600,
		displayTime : 6000,
		textholderHeight : .15,
		displayProgressBar : 0,
		displayThumbnailNumbers : 0,
		displayThumbnailBackground : 0,
		thumbnailWidth : "5px",
		thumbnailHeight : "5px"

	});

});
