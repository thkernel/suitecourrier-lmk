class TenantsMailer < ApplicationMailer
	include SharedUtils::SmtpSettings

    before_action :set_mailer_settings

    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def new_tenant_mail(tenant, admin_password)
        
        @tenant = tenant
        @admin_password = admin_password
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @tenant.email, subject: "Création de votre espace SuiteCourrier")
    end


    

end
