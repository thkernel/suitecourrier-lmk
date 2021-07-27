class OverdueTicketJob < ApplicationJob
  queue_as :overdue_ticket_job

  def perform
    send_overdue_ticket_email
  end

  private

  def send_overdue_ticket_email

  	current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    tickets = Ticket.where(completed_date: nil).id).where("due_date < ? ", compare_date)


  	tickets.each do |ticket|
  		ticket_users = ticket.ticket_users

  		ticket_users.each do |ticket_user|
	  		user = User.find(ticket_user.recipient_id)
	  		#ticket = Ticket.find(ticket_user.ticket_id)

	  		TicketsMailer.overdue_ticket_email(user, ticket).deliver_later
	  	end
  	end
  	
  end
end
