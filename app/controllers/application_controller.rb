class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include ApplicationHelper
	include ActivityLogsConcern
	include SharedUtils::SmtpSettings


	before_action :setup_organization
	before_action :store_user_location!, if: :storable_location?
    before_action :set_mailer_settings
    
	

	rescue_from CanCan::AccessDenied do |exception|  
		flash[:alert] = "Access denied!"  
		redirect_to dashboard_path
	end

	

  


	
		
	def storable_location?
		request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
	end

	def store_user_location!
		# :user is the scope we are authenticating
		store_location_for(:user, request.fullpath)
	end



	def setup_organization
		puts "Setup organization ...."
		puts "Checking user profil...."
		#if request.subdomain.present? && request.subdomain != 'www'   
		if current_user.present?
			puts "Yes, user exist..."
			if current_user.admin? || current_user.superuser?
				
			puts "User profile is: #{current_user.id}"
			puts "Current organization is: #{current_organization.inspect}"
				unless  current_organization.present? 
					puts "Organization not exist..."
					redirect_to setup_organization_path
				end	
			end
		end
		#end
	end

end
