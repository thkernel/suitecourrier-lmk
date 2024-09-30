






$(document).on('turbolinks:load', function(){


        ajaxRefresh("#document_nature_id", "/documents/get_natures", "GET");
        ajaxRefresh("#document_support_id", "/documents/get_supports", "GET");
        ajaxRefresh("#document_folder_id", "/documents/get_folders", "GET");

});

/*
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

*/

$(document).on('turbolinks:load', function() {  

    new SlimSelect({
      select: '#nature_id',
      settings: {
        
        disabled: false,
        alwaysOpen: false,
        showSearch: true,
        focusSearch: true,
        searchPlaceholder: 'Recherche',
        searchText: 'Aucun résultat',
        searchingText: 'Recherche...',
        searchHighlight: false,
        closeOnSelect: true,
        contentLocation: document.body,
        contentPosition: 'absolute',
        openPosition: 'auto', // options: auto, up, down
        placeholderText: 'Sélectionner',
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


$(document).on('turbolinks:load', function() {  

    new SlimSelect({
      select: '#support_id',
      settings: {
        
        disabled: false,
        alwaysOpen: false,
        showSearch: true,
        focusSearch: true,
        searchPlaceholder: 'Recherche',
        searchText: 'Aucun résultat',
        searchingText: 'Recherche...',
        searchHighlight: false,
        closeOnSelect: true,
        contentLocation: document.body,
        contentPosition: 'absolute',
        openPosition: 'auto', // options: auto, up, down
        placeholderText: 'Sélectionner',
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


$(document).on('turbolinks:load', function() {  

    new SlimSelect({
      select: '#tag-list',
      settings: {
        
        disabled: false,
        alwaysOpen: false,
        showSearch: true,
        focusSearch: true,
        searchPlaceholder: 'Recherche',
        searchText: 'Aucun résultat',
        searchingText: 'Recherche...',
        searchHighlight: false,
        closeOnSelect: true,
        contentLocation: document.body,
        contentPosition: 'absolute',
        openPosition: 'auto', // options: auto, up, down
        placeholderText: 'Sélectionner',
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


/*

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
*/




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

  



/*

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

*/