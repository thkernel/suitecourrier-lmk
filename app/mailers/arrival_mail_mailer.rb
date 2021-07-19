class ArrivalMailMailer < ActionMailer::Base

    before_action :set_mailer_settings
    
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def unprocessed_arrival_mail(arrival_mail)
        @user = User.find(arrival_mail.processing_recipient_id)
        @arrival_mail = arrival_mail
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Courrier arrivé non traité")
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
          :ssl => smtp_config.ssl,
          :openssl_verify_mode => 'none'
                })
                
            end
        end
end