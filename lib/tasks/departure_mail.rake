namespace :departure_mail do
  desc "unprocessed departure mail job"
  task unprocessed_departure_mail: :environment do
  	
  	UnprocessedDepartureMailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed departure mail, at: #{Time.now} ===========")
  end

  desc "check departure mail processing_deadline job"
  task check_departure_mail_processing_deadline: :environment do
  	
  	CheckDepartureMailProcessingDeadlineJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: check departure mail processing_deadline job, at: #{Time.now} ===========")
  end

end
