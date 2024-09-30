$(document).on('turbolinks:load', function(){


    // Get doctor by service
    //ajaxFilterPost("#arrival_mail_register_id", "/arrival_mails/get_reference", "GET");
    displayArrivalMailLinkedMail();
    displayArrivalMailAnswerDates();


    $("#arrival_mail_linked_to_mail").on('change', function(){
        displayArrivalMailLinkedMail();
    })

    $("#arrival_mail_to_answer").on('change', function(){
        displayArrivalMailAnswerDates();
    })


});


function displayArrivalMailLinkedMail(){

    arrival_mail_linked_to_mail = $('#arrival_mail_linked_to_mail').val();

    if (arrival_mail_linked_to_mail != null && arrival_mail_linked_to_mail == "Oui"){
        $(".arrival_mail_linked_mail").css("display", "block");
        
    }
    else{
        $(".arrival_mail_linked_mail").css("display", "none");

    }
}

function displayArrivalMailAnswerDates(){

    arrival_mail_to_answer = $('#arrival_mail_to_answer').val();

    if (arrival_mail_to_answer != null && arrival_mail_to_answer == "Oui"){
        $(".arrival_mail_response_limit_time").css("display", "block");
        $(".arrival_mail_response_date").css("display", "block");

        
    }
    else{
        $(".arrival_mail_response_limit_time").css("display", "none");
        $(".arrival_mail_response_date").css("display", "none");

    }
}


$(document).on('turbolinks:load', function(){


        //ajaxRefresh("#arrival_mail_nature_id", "/arrival_mails/get_natures", "GET");
        //ajaxRefresh("#arrival_mail_support_id", "/arrival_mails/get_supports", "GET");
        //ajaxRefresh("#arrival_mail_correspondent_id", "/arrival_mails/get_correspondents", "GET");
        //ajaxRefresh("#arrival_mail_folder_id", "/arrival_mails/get_folders", "GET");

        ajaxFilterByID("#arrival_mail_processing_entity_id", "/arrival-mails/get_profiles", "GET");
       

});


//$(document).on('turbolinks:load', function() {  
/*
$(document).ready(function() {

  $('#nature_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
       
        language: {
            noResults: function () {
                 return "<a data-remote='true' href='/natures/new'>+ Ajouter</a>";
            }
        }
    });

});
*/

//$(document).on('turbolinks:load', function() {  
/*
$(document).ready(function() {

  $('#support_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/supports/new'>+ Ajouter</a>";
            }
        }
    });

});

//$(document).on('turbolinks:load', function() {  
$(document).ready(function() {
  $('#correspondent_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/correspondents/new'>+ Créer un correspondant</a>";
            }
        }
    });

});*/

$(document).on('turbolinks:load', function() {  

    new SlimSelect({
      select: '#correspondent_id',
      settings: {
        
        disabled: false,
        alwaysOpen: false,
        showSearch: true,
        focusSearch: true,
        searchPlaceholder: 'Search',
        searchText: 'No Results',
        searchingText: 'Searching...',
        searchHighlight: false,
        closeOnSelect: true,
        contentLocation: document.body,
        contentPosition: 'absolute',
        openPosition: 'auto', // options: auto, up, down
        placeholderText: 'Select Value',
        allowDeselect: false,
        hideSelected: false,
        showOptionTooltips: false,
        minSelected: 0,
        maxSelected: 1000,
        timeoutDelay: 200,
        maxValuesShown: 20,
        maxValuesMessage: '{number} selected',
        addableText: 'Appuyer "Entrée" ou sur le bouton "+" pour ajouter {value}',
      },
      events: {
        // Allow anything
        addable: function (value) { return value },

        // or

        // Decide what is allowed to be added
        addable: function (value) {
          // return false or null if you do not want to allow value to be submitted
          if (value === 'bad') { return false }

          // return new

          // Return the value string
          return value // Optional - value alteration // ex: value.toLowerCase()

          // Optional - Return a valid data object.
          // See methods/setData for list of valid options
          return {
            text: value,
            value: value.toLowerCase()
          }

          // Optional - Return a promise with either a string or data object
          return new Promise((resolve) => {
            resolve({
              text: value,
              value: value,
            })
          })
        }

        
      }

    })

});



//$(document).on('turbolinks:load', function() { 
/*
$(document).ready(function() { 

  $('#folder_id').select2({
        
        escapeMarkup: function (markup) { return markup; },
        language: {
            noResults: function () {
                return "<a data-remote='true' href='/folders/new'>+ Créer un dossier</a>";
            }
        }
    });

});
*/






$(document).on('turbolinks:load', function() {
    $('#arrival-mail #nature-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[nature_id]"]', "/get/last_nature", "GET");

    });
});



$(document).on('turbolinks:load', function() {
    $('#arrival-mail #support-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[support_id]"]', "/get/last_support", "GET");

    });
});



$(document).on('turbolinks:load', function() {
    $('#arrival-mail #correspondent-modal').on('hide.bs.modal', function() {
      console.log("BEFORE ARRIVAL MAIL CORRESPONDENT");
    ajaxGetLastRecord('select[name="arrival_mail[correspondent_id]"]', "/get/last_correspondent", "GET");
    console.log("AFTER ARRIVAL MAIL CORRESPONDENT");

    });
});

$(document).on('turbolinks:load', function() {
    $('#arrival-mail #folder-modal').on('hide.bs.modal', function() {
      
    ajaxGetLastRecord('select[name="arrival_mail[folder_id]"]', "/get/last_folder", "GET");

    });
});










/*
$(document).on('turbolinks:load', function() {
    $('#nature-modal').on('hide.bs.modal', function() {
      
        $('#arrival_mail_nature_id').trigger('focus');

    ajaxRefresh("#arrival_mail_nature_id", "/arrival_mails/get_natures", "GET");
    console.log("NATURE MODAL HIDE");

    });
  });
  */

/*
$(document).on('turbolinks:load', function() {
     console.log("SEL BGIN");
    $("#arrival_mail_nature_id").select2({
        ajax: {
        url: "/get_natures", //URL for searching companies
        dataType: "json",
        delay: 200,
        data: function (params) {
            return {
            term: params.term, //params send to companies controller
            };
        },
        processResults: function (data) {
            return {
            results: data
            };
        },
        cache: true
        },
    });
});
  */