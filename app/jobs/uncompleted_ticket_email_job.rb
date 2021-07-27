class UncompletedTicketEmailJob < ApplicationJob
  queue_as :uncompleted_ticket_email_job

  def perform
    uncompleted_ticket_email
  end

  private

  def uncompleted_ticket_email

  	current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    tickets = Ticket.where(completed_date: nil).where("due_date < ? ", compare_date)


  	tickets.each do |ticket|
  		ticket_users = ticket.ticket_users

  		ticket_users.each do |ticket_user|
	  		user = User.find(ticket_user.recipient_id)
	  		#ticket = Ticket.find(ticket_user.ticket_id)

	  		TicketsMailer.uncompleted_ticket_email(user, ticket).deliver_later
	  	end
  	end
  	
  end
end
