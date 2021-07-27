class TicketsMailer < ApplicationMailer
	include SharedUtils::SmtpSettings

    before_action :set_mailer_settings

    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def uncompleted_ticket_warning_email(user, ticket)
        
        @user = user
        @ticket = ticket
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "La date limite de traitement d'un ticket expirera bientôt!")
    end

    def uncompleted_ticket_email(user, ticket)
        
        @user = user
        @ticket = ticket
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Ticket non traité")
    end


    def ticket_attribution_email(user_id, ticket)
        
        @user = User.find(user_id)
        @ticket = ticket
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Un ticket vous a été adressé")
    end
end
