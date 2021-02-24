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

  	# For storage areas.
  	if has_storage_area?
  		@storage_area = StorageArea.first
  	else
  		@storage_area = StorageArea.new
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
