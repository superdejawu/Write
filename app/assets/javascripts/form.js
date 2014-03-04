$(document).ready(function(){

	$(".postbutton").on("click", function(){
		$(this).closest(".container").siblings("#hidden_content").slideDown();
		$(this).closest(".container").siblings(".bottombar").fadeIn();
		$(this).hide();
		$(this).siblings("#hidden_button").fadeIn();

	});
	
	
  $('#hidden_button').on('click', function() { $('#myForm').submit(); });



});