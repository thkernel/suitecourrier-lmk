include SharedUtils::AppLogger


namespace :arrival_mail do
  desc "unprocessed arrival mail job"
  task unprocessed_arrival_mail: :environment do
  
  	
  	UnprocessedArrivalMailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed arrival mail job, at: #{Time.now} ===========")
  end


  desc "check arrival mail processing deadline job"
  task check_arrival_mail_processing_deadline: :environment do
  
  	
  	CheckArrivalMailProcessingDeadlineJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: check arrival mail processing deadline job, at: #{Time.now} ===========")
  end


end
