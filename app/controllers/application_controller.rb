class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include ApplicationHelper
	include ActivityLogsConcern

	before_action :setup_organization
	before_action :store_user_location!, if: :storable_location?
    before_action :set_mailer_settings
    
	

	rescue_from CanCan::AccessDenied do |exception|  
		flash[:alert] = "Access denied!"  
		redirect_to dashboard_path
	end

	

  def set_mailer_settings
	
      smtp_config = SmtpServerSetting.take

			if smtp_config.present?
				ActionMailer::Base.smtp_settings.merge!({
					:host => smtp_config.host ,
					:address => smtp_config.address , 
					:port => smtp_config.port,
					:domain => smtp_config.domain,
					:authentication => smtp_config.authentification,
					:user_name => smtp_config.user_name,
					:password => smtp_config.user_password,
          :enable_starttls_auto => smtp_config.enable_starttls_auto,
          :ssl => smtp_config.smtp_ssl
				})
				
			end
				#ActionMailer::Base.default_options = {from: "slatejob.official@gmail.com"}

	

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
