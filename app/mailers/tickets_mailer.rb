class TicketsMailer < ApplicationMailer
	include SharedUtils::SmtpSettings

    before_action :set_mailer_settings

    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def overdue_ticket_email(user, ticket)
        
        @user = user
        @ticket = ticket
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Ticket en retard de traitement")
    end
end
