// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//Default
// require rails-ujs
// require turbolinks
// require_tree .

//By me
//= require jquery
//= require rails-ujs

// require geocomplete
// require jquery.geocomplete
//= require turbolinks

//= require popper
//= require bootstrap-sprockets
//= require bootstrap
//= require toastr
//= require rails.validations

// OLD BRACKET


//= require lib/DataTables/datatables.min
//= require lib/DataTables/Responsive-2.2.6/js/responsive.bootstrap4.min

//= require lib/DataTables/Buttons-1.6.5/js/buttons.bootstrap.min




//= require cocoon

// NEW BRACKET JS
//= require lib/jquery-ui/ui/widgets/datepicker
//= require lib/bootstrap/js/bootstrap.bundle.min
//= require lib/perfect-scrollbar/perfect-scrollbar.min
//= require lib/moment/min/moment.min
//= require lib/peity/jquery.peity.min
//= require lib/rickshaw/vendor/d3.min
//= require lib/rickshaw/vendor/d3.layout.min
//= require lib/rickshaw/rickshaw.min
//= require lib/jquery.flot/jquery.flot
//= require lib/jquery.flot/jquery.flot.resize
//= require lib/flot-spline/js/jquery.flot.spline.min
// require lib/jquery-sparkline/jquery.sparkline.min
// require lib/echarts/echarts.min
//= require lib/select2/js/select2.full.min

//= require js/bracket
//= require js/ResizeSensor
//= require js/dashboard

//= require arrival_mails
//= require imputations
//= require departure_mails
//= require documents
//= require custom_users


$(document).on('turbolinks:load', function() {
 var datatable = {
      
    "searching": true,
    "ordering": true,
    language: {
        processing: "Traitement en cours...",
        search: "Rechercher&nbsp;:",
        lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
        info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        infoPostFix: "",
        loadingRecords: "Chargement en cours...",
        zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
        emptyTable: "Aucune donnée disponible dans le tableau",
        paginate: {
            first: "Premier",
            previous: "Pr&eacute;c&eacute;dent",
            next: "Suivant",
            last: "Dernier"
        },
        aria: {
            sortAscending: ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
        }
    },
    responsive: false
      };
      
      $('#datatable1').DataTable(datatable);
      $('#imputations-table').DataTable(datatable);
      $('#requests-table').DataTable(datatable);
      $('#tasks-table').DataTable(datatable);
});


$(document).on('turbolinks:load', function() {
 var datatable_without_search = {
      
    
    "ordering": true,
    language: {
        processing: "Traitement en cours...",
        search: "Rechercher&nbsp;:",
        lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
        info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        infoPostFix: "",
        loadingRecords: "Chargement en cours...",
        zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
        emptyTable: "Aucune donnée disponible dans le tableau",
        paginate: {
            first: "Premier",
            previous: "Pr&eacute;c&eacute;dent",
            next: "Suivant",
            last: "Dernier"
        },
        aria: {
            sortAscending: ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
        }
    },
    responsive: false
      };
      
      
      $('#searchs-table').DataTable(datatable_without_search);
      
});


$(document).on('turbolinks:load', function() {
  $('body').on('shown.bs.modal', '.modal', function() {
    $(this).find('.customSelect select').each(function() {
      var dropdownParent = $(document.body);
      if ($(this).parents('.modal.in:first').length !== 0)
        dropdownParent = $(this).parents('.modal.in:first');
      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
    });
  });
});

$(document).on('turbolinks:load', function() {  

  $(this).find('.customSelect select').each(function() {
    var dropdownParent = $(document.body);

      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
  });

});




// Ajax call.

function ajaxRefresh(source, route, verb){
  console.log("Source: ", source);
  //$(source).empty();
  $(source).on('select2:opening', function() {
    console.log("Source: ", source);
    
      $.ajax({
          type: verb,
          headers: {
              'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
              },
          dataType: 'script',
          url: route
      });

     
  });

};

function ajaxFilterPost(source, route, verb){
  console.log("Source: ", source);
  $(source).on("change", function() {
      $.ajax({
          type: verb,
          headers: {
              'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
              },
          dataType: 'script',
          url: route,
          data: { data: $(source + ' option:selected').val()}
      });
  });
};

function ajaxFilterByID(source, route, verb){
  console.log("Source: ", source);
  $(source).on("change", function() {
      $.ajax({
          type: verb,
          headers: {
              'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
              },
          dataType: 'script',
          url: route,
          data: { id: $(source + ' option:selected').val()}
      });
  });
};


$(document).on('turbolinks:load', function(){

  $('#document_tag_list').select2({
      tags: true,
    
      tokenSeparators: [',', ' '],
      createTag: function (params) {
          var term = $.trim(params.term);
      
          if (term === '') {
            return null;
          }
      
          return {
            id: term,
            text: term,
            newTag: true // add additional parameters
          }
        }
  });
});


function ajaxGetLastRecord(target, route, verb){
    console.log("Source: ", route);
       console.log("IN ARRIVAL MAIL CORRESPONDENT");
    $.ajax({
            type: verb,
            headers: {
                'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                },
            dataType: 'json',
            url: route,
            cache:true,
            
          
            success: function(response) {
                
                
                last_record_id = response.last_record.id;
                last_record_name = getOrganizationName(response.last_record);
                all_records = response.all_records;


                $(target).empty();
                $(target).append('<option value="">Sélectionner</option>');
                

                

                $.each(all_records, function(key,value){

                    if (last_record_name === getOrganizationName(value)){
                        $(target).append('<option value="'+ value.id +'" selected>' + getOrganizationName(value) + '</option>');

                    }else{
                        $(target).append('<option value="'+ value.id +'">' + getOrganizationName(value) + '</option>');


                    }

                });
                
                

            },
            error: function(xhr, textStatus, error) {
                console.log(xhr.responseText);
       
            }

            
    });
    console.log("AFTER ARRIVAL MAIL CORRESPONDENT IN AJAX");
 
};

function getOrganizationName(record){
    var name = null;

    if (record.organization_name !== null && record.organization_name !== "" && record.organization_name !== undefined ){
      name = record.organization_name;
      
    }
    else if ((record.contact_last_name !== "" && record.contact_last_name !== null && record.contact_last_name !== undefined) || (record.contact_first_name !== "" && record.contact_first_name !== null && record.contact_first_name !== undefined)){
        name = record.contact_last_name + " " + record.contact_first_name ;
        
    }
    else if (record.name){
        // For others resources differents to correspondents.
        name = record.name;
        
    }

    return name;

}