class ArrivalMailProcessingWarningEmailJob < ApplicationJob
  queue_as :arrival_mail_processing_warning_email_job

  def perform
    arrival_mail_processing_warning_email
  end


  

  def arrival_mail_processing_warning_email

  	current_date = Time.now.strftime("%d/%m/%Y").to_date
  	
  	#(Time.now - self.created_at) / 86400 (nombre de seconde par jour)

  	#current_date = "17/07/2021".to_date

    compare_date = current_date + 1.day
    arrival_mails = ArrivalMail.where(processed: nil)#.where("processing_deadline < ? ", compare_date)


    arrival_mails.each do |arrival_mail|
    	processing_deadline = arrival_mail.processing_deadline.strftime("%d/%m/%Y").to_date
    	date_diff = (processing_deadline - current_date).to_i

    	if date_diff >= 1
	    	# Send notification by email
	    	ArrivalMailsMailer.arrival_mail_processing_warning_email(arrival_mail).deliver_now

    	end
    end
  	
  end
end
