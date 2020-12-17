class HomeController < ApplicationController

    before_action :unauthorize_home_for_tenant
    
    def index 
    end

    def unauthorize_home_for_tenant
        if request.subdomain.present? && request.subdomain != 'www' 
            redirect_to new_user_session_path
        
        
        end
    
    end

end