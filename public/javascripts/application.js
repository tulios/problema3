function show_error(message) {
	show_message(message, "error");
}

function show_notice(message) {
	show_message(message, "notice");
}

function show_message(message, css_class){
	$(".messages").hide();
	$(".messages").addClass(css_class);
	$(".messages .text").html(message);
	
	$(".messages").slideDown("slow").delay(3000).slideUp("slow", function(){
		$(".messages .text").html("");
		$(".messages").removeClass(css_class);
	});
}
