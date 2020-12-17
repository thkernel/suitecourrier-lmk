$(document).on('turbolinks:load', function(){


   
    // Get doctor by service
    ajaxFilterByID("#imputation_service_id", "/imputations/get_profiles", "GET");
    ajaxFilterByID("#imputation_direction_id", "/imputations/get_divisions", "GET");
    ajaxFilterByID("#imputations_division_id", "/imputations/get_services", "GET");

    
});

