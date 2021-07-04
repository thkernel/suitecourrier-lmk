class QuoteRequestMailer < ActionMailer::Base
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    default from: "<salut.amos@gmail.com>"

    def contact(quote_request)
        #@user = User.find(user_id)
        @quote_request = quote_request
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: "salut.amos@gmail.com", subject: "Nouvelle demande de devis")
    end
end