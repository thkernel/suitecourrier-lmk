namespace :departure_mail do
  desc "unprocessed departure mail job"
  task unprocessed_departure_mail_email: :environment do
  	
  	UnprocessedDepartureMailEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed departure mail, at: #{Time.now} ===========")
  end

  desc "check departure mail processing_deadline job"
  task departure_mail_processing_warning_email: :environment do
  	
  	DepartureMailProcessingWarningEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: check departure mail processing_deadline job, at: #{Time.now} ===========")
  end

end
