
$(document).ready(function() {

	// Add code syntax highlighting
	prettyPrint();

	// Make headers clickable to reveal content
	$('.collapsible-header').click(function(){
		$(this).next().toggle();
		return false;
	});
	
});
