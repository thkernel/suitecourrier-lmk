class UnprocessedDepartureMailEmailJob < ApplicationJob
  #queue_as :default
  queue_as :unprocessed_departure_mail_email_job

  def perform
  	unprocessed_departure_mail_email
  end

  

  def unprocessed_departure_mail_email

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    departure_mails = DepartureMail.where(processed: nil).where("processing_deadline < ? ", compare_date)


    departure_mails.each do |departure_mail|
    	
    	# Send notification by email
      departure_mail.update_column(:processed, false)
    	DepartureMailsMailer.unprocessed_departure_mail_email(departure_mail).deliver_now

    	# Add in the notification queue
    end

  end
end
