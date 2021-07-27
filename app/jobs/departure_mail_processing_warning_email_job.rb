class DepartureMailProcessingWarningEmailJob < ApplicationJob
  queue_as :departure_mail_processing_warning_email_job

  def perform
  	departure_mail_processing_warning_email

  end

  

  def departure_mail_processing_warning_email
  	current_date = Time.now.strftime("%d/%m/%Y").to_date
  	
  	#(Time.now - self.created_at) / 86400 (nombre de seconde par jour)

  	#current_date = "17/07/2021".to_date

    compare_date = current_date + 1.day
    departure_mails = DepartureMail.where(processed: nil)#.where("processing_deadline < ? ", compare_date)


    departure_mails.each do |departure_mail|
    	processing_deadline = departure_mail.processing_deadline.strftime("%d/%m/%Y").to_date
    	date_diff = (processing_deadline - current_date).to_i

    	if date_diff >= 1
	    	# Send notification by email
	    	DepartureMailsMailer.departure_mail_processing_warning_email(departure_mail).deliver_now

    	end
    end
  end
end
