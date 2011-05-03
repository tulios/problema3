function show_error(message) {
	show_message(message, "error");
}

function show_notice(message) {
	show_message(message, "notice");
}

function show_message(message, css_class){
	var new_message = $("<div class='message "+css_class+"'><div class='text'>"+message+"</div></div>");
	new_message.hide();
	new_message.appendTo($(".messages_div"));
	
	new_message.slideDown("slow").delay(1000).slideUp("slow", function(){
		new_message.remove();
	});
}