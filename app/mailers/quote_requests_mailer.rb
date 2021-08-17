class QuoteRequestsMailer < ActionMailer::Base
    include SharedUtils::SmtpSettings

    before_action :set_mailer_settings

    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?


    def contact(quote_request)
        #@user = User.find(user_id)
        @quote_request = quote_request
        
        #puts "ACTION MAILER SERVER SETTINGS: #{ActionMailer::Base.smtp_settings[:user_name]}"
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: "request@suitecourrier.com", subject: "Nouvelle demande de devis")
    end

    
end