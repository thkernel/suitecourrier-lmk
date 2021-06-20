$(document).on('turbolinks:load', function(){


    // Get doctor by service
    //ajaxFilterPost("#departure_mail_register_id", "/departure_mails/get_reference", "GET");
    displayDepartureMailLinkedMail();
    displayDepartureMailAnswerDates();


    $("#departure_mail_linked_to_mail").on('change', function(){
        displayDepartureMailLinkedMail();
    })

    $("#departure_mail_to_answer").on('change', function(){
        displayDepartureMailAnswerDates();
    })


});


function displayDepartureMailLinkedMail(){

    departure_mail_linked_to_mail = $('#departure_mail_linked_to_mail').val();

    if (departure_mail_linked_to_mail != null && departure_mail_linked_to_mail == "Oui"){
        $(".departure_mail_linked_mail").css("display", "block");
        
    }
    else{
        $(".departure_mail_linked_mail").css("display", "none");

    }
}

function displayDepartureMailAnswerDates(){

    departure_mail_to_answer = $('#departure_mail_to_answer').val();

    if (departure_mail_to_answer != null && departure_mail_to_answer == "Oui"){
        $(".departure_mail_response_limit_time").css("display", "block");
        $(".departure_mail_response_date").css("display", "block");

        
    }
    else{
        $(".departure_mail_response_limit_time").css("display", "none");
        $(".departure_mail_response_date").css("display", "none");

    }
}

$(document).on('turbolinks:load', function(){


   
        // Get doctor by service
        ajaxRefresh("#departure_mail_nature_id", "/departure_mails/get_natures", "GET");
        ajaxRefresh("#departure_mail_support_id", "/departure_mails/get_supports", "GET");
        ajaxRefresh("#departure_mail_correspondent_id", "/departure_mails/get_correspondents", "GET");
        ajaxRefresh("#departure_mail_folder_id", "/departure_mails/get_folders", "GET");

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

  $('#correspondent_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/correspondents/new'>+ Ajouter</a>";
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
    $('#departure-mail #nature-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="departure_mail[nature_id]"]', "/get/last_nature", "GET");

    });
});

$(document).on('turbolinks:load', function() {
    $('#departure-mail #support-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="departure_mail[support_id]"]', "/get/last_support", "GET");

    });
});

$(document).on('turbolinks:load', function() {
    $('#departure-mail #correspondent-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="departure_mail[correspondent_id]"]', "/get/last_correspondent", "GET");

    });
});

$(document).on('turbolinks:load', function() {
    $('#departure-mail #folder-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="departure_mail[folder_id]"]', "/get/last_folder", "GET");

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

function getName(record){
    var name = null;

    if (record.organization_name !== null && record.organization_name !== "" && record.organization_name !== undefined ){
      name = record.organization_name;
    }
    else if ((record.contact_last_name !== "" && record.contact_last_name !== null && record.contact_last_name !== undefined) || (record.contact_first_name !== "" && record.contact_first_name !== null && record.contact_first_name !== undefined)){
        name = record.contact_last_name + " " + record.contact_first_name ;
    }
    else if (record.name){
        name = record.name;
    }

    return name;

}