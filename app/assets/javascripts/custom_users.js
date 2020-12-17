$(document).on('turbolinks:load', function(){


    $('#user-modal').on('shown.bs.modal', function() {
      
        ajaxFilterByID("#user_profile_attributes_direction_id", "/custom_users/get_divisions", "GET");
        ajaxFilterByID("#user_profile_attributes_division_id", "/custom_users/get_services", "GET");

    });
});