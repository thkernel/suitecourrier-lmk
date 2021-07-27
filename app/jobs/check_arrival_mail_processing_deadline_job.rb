class CheckArrivalMailProcessingDeadlineJob < ApplicationJob
  queue_as :check_arrival_mail_processing_deadline_job

  def perform
    check_arrival_mail_processing_deadline
  end


  private

  def check_arrival_mail_processing_deadline

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
	    	ArrivalMailsMailer.check_arrival_mail_processing_deadline_mail(arrival_mail).deliver_now

    	end
    end
  	
  end
end
