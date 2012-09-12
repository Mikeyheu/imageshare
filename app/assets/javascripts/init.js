jQuery(function($) {
   $('#sortable').sortable({
   		update: function(){
			$.post($(this).data('update-url'), $(this).sortable('serialize'))
		}
	});
});


