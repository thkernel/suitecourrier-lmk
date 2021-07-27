class UncompletedTicketWarningEmailJob < ApplicationJob
  queue_as :uncompleted_ticket_warning_email_job

  def perform
    uncompleted_ticket_warning_email
  end

  private

  def uncompleted_ticket_warning_email

  	current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    tickets = Ticket.where(completed_date: nil).where("due_date < ? ", compare_date)


  	tickets.each do |ticket|
  		ticket_users = ticket.ticket_users

  		ticket_users.each do |ticket_user|
	  		user = User.find(ticket_user.recipient_id)
	  		#ticket = Ticket.find(ticket_user.ticket_id)
        due_date = ticket.due_date.strftime("%d/%m/%Y").to_date
        date_diff = (due_date - current_date).to_i

        if date_diff >= 1

	  		 TicketsMailer.uncompleted_ticket_warning_email(user, ticket).deliver_later
        end
	  	end
  	end
  	
  end
end
