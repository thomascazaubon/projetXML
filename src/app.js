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
	
	$('.btnmaquette').click(function(){
		var idmaquette = $(this).attr('data-id');
		if($(".maquette[data-id='" + idmaquette +"']").hasClass('none')){
			$(".maquette[data-id='" + idmaquette +"']").removeClass('none');
			$(this).addClass('click');
		} else {
			$(".maquette[data-id='" + idmaquette +"']").addClass('none');
			$(this).removeClass('click');
		}
	});
});
