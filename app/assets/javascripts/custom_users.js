$(document).on('turbolinks:load', function(){


    $('#user-modal').on('shown.bs.modal', function() {

    	$('#user_profile_attributes_entity_type_id').on('change', function() {
      
        	ajaxFilterByID("#user_profile_attributes_entity_type_id", "/custom_users/get_entities", "GET");
        	//ajaxFilterByID("#user_profile_attributes_division_id", "/custom_users/get_services", "GET");
        });
    });
});