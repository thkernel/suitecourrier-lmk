class DepartureMailsMailer < ActionMailer::Base

    include SharedUtils::SmtpSettings

    before_action :set_mailer_settings
    
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def unprocessed_departure_mail_email(departure_mail)
        @user = User.find(departure_mail.processing_recipient_id)
        @departure_mail = departure_mail
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Courrier arrivé non traité")
    end

    def departure_mail_processing_warning_email(departure_mail)
        @user = User.find(departure_mail.processing_recipient_id)
        @departure_mail = departure_mail
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "La date limite de traitement d'un courrier départ expirera bientôt")
    end


    
end