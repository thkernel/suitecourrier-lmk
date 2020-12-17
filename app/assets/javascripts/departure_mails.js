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
