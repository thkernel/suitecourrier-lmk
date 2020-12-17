class ImputationMailer < ActionMailer::Base
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    default from: "<#{Config.take.smtp_user_name if Config.take}>"

    def new_imputation_mail(user_id, imputation)
        @user = User.find(user_id)
        @imputation = imputation
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Nouvelle imputation")
    end
end