$(document).ready(function() {
	$("div.panel_button").click(function(){
		$("div#panel").animate({
		    height: "500px"
		},"slow")
		.animate({
			height: "400px"
		}, "slow");
		$("div.panel_button").toggle();
	
	});	
	
   $("div#hide_button").click(function(){
		$("div#panel").animate({
			height: "0px"
		}, "fast");
		
	
   });	
	
});