$(document).ready(function(){

	$(".postbutton").on("click", function(){
		$(this).closest(".container").siblings("#hidden_content").slideDown();
		$(this).closest(".container").siblings(".bottombar").fadeIn();
		$(this).fadeOut();
	});
	
	$(window).scroll(function(){
	var st = $(this).scrollTop(),
	    winH = $(this).height(),
	    /* you can set this add, 
	    depends on where you want the animation to start
	    for example if the section height is 100 and you set add of 50,
	    that means if 50% of the section is revealed 
	    on the bottom of viewport animate text
	    */
	    add = 150;

		$('section').each(function(){
		    var pos = $(this).position().top;

		    if(st + winH >= pos + add){
		        $(this).stop().animate({opacity:1, marginTop:10},'fast');
		    }else{
		        $(this).stop().animate({opacity:0, marginTop:0},'fast');
		    }
		});
	});
});