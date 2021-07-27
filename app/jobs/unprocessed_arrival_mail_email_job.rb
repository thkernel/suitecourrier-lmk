class UnprocessedArrivalMailEmailJob < ApplicationJob
	include SharedUtils::AppLogger
  #queue_as :default
  queue_as :unprocessed_arrival_mail_email_job

  def perform
  	unprocessed_arrival_mail_email
  end

  

  def unprocessed_arrival_mail_email

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    arrival_mails = ArrivalMail.where(processed: nil).where("processing_deadline < ? ", compare_date)


    arrival_mails.each do |arrival_mail|
    	
    	# Send notification by email
      arrival_mail.update_column(:processed, false)
    	ArrivalMailsMailer.unprocessed_arrival_mail_email(arrival_mail).deliver_now

    	# Add in the notification queue
    end

  end
end
