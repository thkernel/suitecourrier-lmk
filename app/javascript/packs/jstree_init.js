$(document).on('turbolinks:load', function() {
	//$('#jstree').jstree();

	$('#jstree').jstree({
	  "core" : {
	    "animation" : 0,
	    "check_callback" : true,
	    "themes" : { "stripes" : true },
	    /*'data' : {
	      'url' : function (node) {
	        return node.id === '#' ?
	          'ajax_demo_roots.json' : 'ajax_demo_children.json';
	      },
	      'data' : function (node) {
	        return { 'id' : node.id };
	      }
	    }*/
	  },
	  "types" : {
	    "#" : {
	      "max_children" : 1,
	      "max_depth" : 4,
	      "valid_children" : ["root"]
	    },
	    "root" : {
	      "icon" : "/static/3.3.17/assets/images/tree_icon.png",
	      "valid_children" : ["default"]
	    },
	    "default" : {
	      "valid_children" : ["default","file"]
	    },
	    "file" : {
	      "icon" : "glyphicon glyphicon-file",
	      "valid_children" : []
	    }
	  },
	  "plugins" : [
	    "contextmenu", "dnd", "search",
	    "state", "types", "wholerow"
	  ]
	});

	$('#jstree').on("changed.jstree", function (e, data) {
		
	  console.log(data.selected);

    $('#folder-id').val(data.selected);
     //$("#"+price).val(_price);

	  
	});


	$('#jstree').on("create_node.jstree", function (e, data) {
		data = { 'type': data.node.type, 'id': data.node.parent, 'text': data.node.text }
	  console.log("CREATED NODE", data);

	  
	});
});

