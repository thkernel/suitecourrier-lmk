class ApplicationController < ActionController::Base
	include ActivityLogsConcern

	before_action :store_user_location!, if: :storable_location?


  protect_from_forgery with: :exception
	before_action :google_login, except: [:set_google_drive_token]
	include ApplicationHelper

	rescue_from CanCan::AccessDenied do |exception|  
		flash[:alert] = "Access denied!"  
		redirect_to dashboard_path
	end

	

  def set_mailer_settings
	
      smtp_config = Config.take

			if smtp_config.present?
				ActionMailer::Base.smtp_settings.merge!({
					:address => smtp_config.smtp_address , 
					:port => smtp_config.smtp_port,
					:domain => smtp_config.smtp_domain,
					:authentication => smtp_config.smtp_authentification,
					:user_name => smtp_config.user_name,
					:password => smtp_config.user_password,
          :enable_starttls_auto => smtp_config.enable_starttls_auto,
          :ssl => smtp_config.smtp_ssl
				})
				
			end
				#ActionMailer::Base.default_options = {from: "slatejob.official@gmail.com"}

	

  end


	def google_login
		unless $drive.get_credentials
			redirect_to oauth2callback_path
		end
	end
		
	def storable_location?
		request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
	end

	def store_user_location!
		# :user is the scope we are authenticating
		store_location_for(:user, request.fullpath)
	end

end
