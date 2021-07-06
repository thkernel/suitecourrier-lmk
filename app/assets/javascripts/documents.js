






$(document).on('turbolinks:load', function(){


        ajaxRefresh("#document_nature_id", "/documents/get_natures", "GET");
        ajaxRefresh("#document_support_id", "/documents/get_supports", "GET");
        ajaxRefresh("#document_folder_id", "/documents/get_folders", "GET");

});


$(document).on('turbolinks:load', function() {  

  $('#nature_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
       
        language: {
            noResults: function () {
                 return "<a data-remote='true' href='/natures/new'>+ Ajouter</a>";
            }
        }
    });

});

$(document).on('turbolinks:load', function() {  

  $('#support_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/supports/new'>+ Ajouter</a>";
            }
        }
    });

});



$(document).on('turbolinks:load', function() {  

  $('#folder_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/folders/new'>+ Ajouter</a>";
            }
        }
    });

});




$(document).on('turbolinks:load', function() {
    $('#document #nature-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[nature_id]"]', "/get/last_nature", "GET");

    });
});

$(document).on('turbolinks:load', function() {
    $('#document #support-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[support_id]"]', "/get/last_support", "GET");

    });
});



$(document).on('turbolinks:load', function() {
    $('#document #folder-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[folder_id]"]', "/get/last_folder", "GET");

    });
});

  





function ajaxGetLastRecord(target, route, verb){
    console.log("Source: ", route);
  
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
                last_record_name = getName(response.last_record);
                all_records = response.all_records;


                $(target).empty();
                $(target).append('<option value="">Sélectionner</option>');
                

                // For each record

                $.each(all_records, function(key, value){

                    if (last_record_name === getName(value)){
                        $(target).append('<option value="'+ key +'" selected>' + getName(value) + '</option>');

                    }else{
                        $(target).append('<option value="'+ key +'">' + getName(value) + '</option>');


                    }

                });


            }
      });
 
};