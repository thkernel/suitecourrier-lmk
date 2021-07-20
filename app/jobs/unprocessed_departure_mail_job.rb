class UnprocessedDepartureMailJob < ApplicationJob
  #queue_as :default
  queue_as :unprocessed_departure_mail_job

  def perform(*args)
  	unprocessed_arrival_mail
  end

  private

  def unprocessed_departure_mail

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    departure_mails = DepartureMail.where(processed: nil).where("processing_deadline < ? ", compare_date)


    departure_mails.each do |departure_mail|
    	
    	# Send notification by email
      departure_mail.update_column(:processed, false)
    	DepartureMailMailer.unprocessed_departure_mail(departure_mail).deliver_now

    	# Add in the notification queue
    end

  end
end
