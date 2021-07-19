class UnprocessedArrivalMailJob < ApplicationJob
	include SharedUtils::AppLogger
  #queue_as :default
  queue_as :unprocessed_arrival_mail_job

  def perform(*args)
  	unprocessed_arrival_mail
  end

  private

  def unprocessed_arrival_mail

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    arrival_mails = ArrivalMail.where(processed: nil).where("processing_deadline < ? ", compare_date)


    arrival_mails.each do |arrival_mail|
    	
    	# Send notification by email
    	ArrivalMailMailer.unprocessed_arrival_mail(arrival_mail).deliver_now

    	# Add in the notification queue
    end

  end
end
