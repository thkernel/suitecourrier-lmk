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
	    "state", "types", "crrm", "wholerow"
	  ],
	  "search": {
                    "case_sensitive": false,
                    "show_only_matches": true
                },

	});

	$('#jstree').on("changed.jstree", function (e, data) {
		
	  console.log(data.selected);

	    $('#folder-id').val(data.selected);
	     //$("#"+price).val(_price);

	  
	});

	/*
	$('#jstree').on("create_node.jstree", function (e, data) {
		data = { 'type': data.node.type, 'id': data.node.parent, 'text': data.node.text }
	  console.log("CREATED NODE", data);
	  createNode(data);

	  
	});
	*/



	$('#jstree').on("rename_node.jstree", function (e, data) {
		data = { 'type': data.node.type, 'id': data.node.parent, 'text': data.node.text }
	  console.log("CREATED NODE", data);
	  createNode(data);

	  
	});
});


// For search
$(document).ready(function () {
    $(".search-input").keyup(function () {
        var searchString = $(this).val();
        $('#jstree').jstree('search', searchString);
    });
});



function createNode(data){
	console.log("ON NODE CREATION FUNCTION");
/*
	$.get('/<whatever>/FolderBrowser?operation=create_node', { 'type': dta.node.type, 'id': dta.node.parent, 'text': dta.node.text })
            .done(function (d) {
                dta.instance.set_id(dta.node, d.id);
            })
            .fail(function () {
                dta.instance.refresh();
            });
            */


	$.ajax({
    	type: "POST",
     	headers: {
          'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
          },
      	dataType: 'js',
      	url: "/folder/create-node",
      	data: { data},

       success: function(response) {
            
            console.log("RESPONSE");
            //dta.instance.set_id(dta.node, d.id);
            

         
            

        },
        error: function(xhr, textStatus, error) {
            //console.log(xhr.responseText);
            dta.instance.refresh();
   
        }
     });

}








/*


$('#deliverables').jstree({
    'core': {    
      themes: {
            icons: false,
            name: 'proton',
            responsive: false
          },
        'data': [{"id":"publish","parent":"#","text":"publish","icon":"jstree-folder","a_attr":{"href":"#"},"state":{"opened":true}},{"id":"publish/MD5SUM.txt","parent":"publish","text":"MD5SUM.txt (0MB)","icon":"jstree-file"},{"id":"publish/SHA1SUM.txt","parent":"publish","text":"SHA1SUM.txt (0MB)","icon":"jstree-file"},{"id":"publish/VCSA-all-6.0.0-2367421.iso","parent":"publish","text":"VCSA-all-6.0.0-2367421.iso (2723MB)","icon":"jstree-file"},{"id":"publish/VIMSetup-all-6.0.0-2367421.iso","parent":"publish","text":"VIMSetup-all-6.0.0-2367421.iso (2610MB)","icon":"jstree-file"}]
    },
    'search': {
        'case_insensitive': true,
        'show_only_matches' : true
    },
    'plugins': ['search', 'checkbox', 'wholerow']
}).on('search.jstree', function (nodes, str, res) {
    if (str.nodes.length===0) {
$('#deliverables').jstree(true).hide_all();
    }
})

$('#deliverable_search').keyup(function(){
    $('#deliverables').jstree(true).show_all();
    $('#deliverables').jstree('search', $(this).val());
});

*/












