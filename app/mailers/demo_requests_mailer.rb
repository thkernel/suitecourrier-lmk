class DemoRequestsMailer < ActionMailer::Base
    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    default from: "<salut.amos@gmail.com>"

    def contact(demo_request)
        #@user = User.find(user_id)
        @demo_request = demo_request
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: "salut.amos@gmail.com", subject: "Nouvelle demande de démo")
    end
end