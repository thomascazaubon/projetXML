$(document).ready(function() {
	var tab = [];
	$( ".EnseignantUF" ).each(function( index ) {
	  var id = $(this).attr("data-id");
	  if($.inArray(id, tab) == -1){
		tab.push(id);
	  } else {
		$(this).addClass("none");
	  }
	});
	
});
