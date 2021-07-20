class CheckDepartureMailProcessingDeadlineJob < ApplicationJob
  queue_as :check_departure_mail_processing_deadline_job

  def perform
  	check_departure_mail_processing_deadline

  end

  private 

  def check_departure_mail_processing_deadline
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
	    	DepartureMailMailer.check_departure_mail_processing_deadline_mail(departure_mail).deliver_now

    	end
    end
  end
end
