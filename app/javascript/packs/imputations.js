$(document).on('turbolinks:load', function(){


   
    // Get doctor by service
    ajaxFilterByID("#imputation_entity_id", "/imputations/get_profiles", "GET");
    //ajaxFilterByID("#imputation_direction_id", "/imputations/get_divisions", "GET");
    //ajaxFilterByID("#imputation_entity_id", "/imputations/get_services", "GET");

    
});

