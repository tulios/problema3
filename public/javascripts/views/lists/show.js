var todos = {
	
	setupNewTodoLink: function() {
		$(".new_todo_link").button();
		$(".new_todo_link").click(function(e){
			e.preventDefault();
			$(".new_todo_div").fadeIn();
			$("#todo_description").focus();
		});
	},
	
	setupSaveTodo: function() {
		$(".save_todo").button();
		$("#new_todo").live("ajax:success", function(event, data, status, xhr) {
			if (data.match(/^<li/)) {
	      $(".cancel_save_todo").click();
				$(".empty_list").remove();

				var todo = $(data).hide();
				$(".todos").append(todo);
				$('#' + todo.attr("id") + ' input[type="checkbox"]').customInput();
			
				todo.fadeIn();
				
			} else {
				show_error(data);
			}
		});
	},
	
	setupCancelSaveTodo: function() {
		$(".cancel_save_todo").button();
		$(".cancel_save_todo").click(function(e){
			e.preventDefault();
			$(".new_todo_div").fadeOut();
			$("#new_todo")[0].reset();
		});
	},
	
	setupDestroyTodo: function() {
		$(".destroy_todo").live("ajax:success", function(event, data, status, xhr) {
			show_notice(data);
			$(this).parent().fadeOut();
			$(this).parent().remove();
    });
	},
	
	setupCheckTodo: function() {
		$(".todo_check").click(function(e){
			var context = $(this).parent().parent();
			var url = $("input[name='url']", context);
			if (url.size() == 0) {
				$(this).unbind("click");
				$(this).unbind("updateState");
				
			} else {
				var action = url.attr("value");
			
				$.ajax({
					url: action,
					type: 'PUT',
					success: function() {
					}
				});
			}
			
		});
	}
	
}

jQuery(function($){
	
	$('input[type="checkbox"]').customInput();
	
	todos.setupNewTodoLink();
	todos.setupSaveTodo();
	todos.setupCancelSaveTodo();
	todos.setupDestroyTodo();
	todos.setupCheckTodo();
	
});