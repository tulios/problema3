var lists = {
	
	setupNewListLink: function() {
		$(".new_list_link").button();
		$(".new_list_link").click(function(e){
			e.preventDefault();
			$(".new_list_div").fadeIn();
			$("#list_name").focus();
		});
	},
	
	setupSaveList: function() {
		$(".save_list").button();
		$("#new_list").live("ajax:success", function(event, data, status, xhr) {
			if (data.match(/^<li/)) {
				$(".cancel_save_list").click();

				var list = $(data).hide();
				$(".lists").append(list);
				list.fadeIn();
				
			} else {
				show_error(data);
			}
		});
	},
	
	setupCancelSaveList: function() {
		$(".cancel_save_list").button();
		$(".cancel_save_list").click(function(e){
			e.preventDefault();
			$(".new_list_div").fadeOut();
			$("#new_list")[0].reset();
		});
	},
	
	setupDestroyList: function() {
		$(".destroy_list").live("ajax:success", function(event, data, status, xhr) {
			$(this).parent().fadeOut();
			$(this).parent().remove();
    });
	}
	
}

jQuery(function($){
	
	lists.setupNewListLink();
	lists.setupSaveList();
	lists.setupCancelSaveList();
	lists.setupDestroyList();
	
});