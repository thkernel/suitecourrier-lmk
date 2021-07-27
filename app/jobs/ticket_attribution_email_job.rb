class TicketAttributionEmailJob < ApplicationJob
  queue_as :ticket_attribution_email_job

  def perform(user_id, ticket)
    ticket_attribution_email(user_id, ticket)
  end

  

  def ticket_attribution_email(user_id, ticket)

  	TicketsMailer.ticket_attribution_email(user_id, ticket).deliver_later
  end
end
