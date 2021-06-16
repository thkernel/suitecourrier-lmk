class ConfigurationsController < ApplicationController
  
  
  before_action :authenticate_user!
  #before_action :set_config, only: [:show, :edit_smtp_config, :edit, :update, :destroy]

  layout "dashboard"

 

 
  def show
  	#For General settings.
  	if has_general_settings?
  		@general_setting = GeneralSetting.first
  	else
  		@general_setting = GeneralSetting.new
  	end

  	# For SMTP server settings.
  	if has_smtp_server_settings?
  		@smtp_server_setting = SmtpServerSetting.first
  	else
  		@smtp_server_setting = SmtpServerSetting.new
  	end

  	# For storage sevices settings.
  	if has_storage_service_setting?
  		@storage_service_setting = StorageServiceSetting.first
  	else
  		@storage_service_setting = StorageServiceSetting.new
  	end

    # For organization.
    if has_organization?
      @organization_types = OrganizationType.all
      @organization = Organization.first
    else
      @organization_types = OrganizationType.all
      @organization = Organization.new
    end

  end
 
end
