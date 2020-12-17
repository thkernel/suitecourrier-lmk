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


   
        // Get doctor by service
        ajaxRefresh("#arrival_mail_nature_id", "/arrival_mails/get_natures", "GET");
        ajaxRefresh("#arrival_mail_support_id", "/arrival_mails/get_supports", "GET");
        ajaxRefresh("#arrival_mail_correspondent_id", "/arrival_mails/get_correspondents", "GET");
        ajaxRefresh("#arrival_mail_folder_id", "/arrival_mails/get_folders", "GET");

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