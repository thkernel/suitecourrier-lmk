$(document).on('turbolinks:load', function() {
	$('#jstree').jstree();

	$('#jstree').on("changed.jstree", function (e, data) {
  console.log(data.selected);

  
});
});