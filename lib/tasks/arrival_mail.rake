include SharedUtils::AppLogger


namespace :arrival_mail do
  desc "TODO"
  task unprocessed_arrival_mail: :environment do
  
  	# Do
  	cron_logger.info("======== BEFORE CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  	UnprocessedArrivalMailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  end

end
