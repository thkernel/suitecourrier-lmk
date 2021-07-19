namespace :departure_mail do
  desc "TODO"
  task unprocessed_departure_mail: :environment do
  	# Do
  	cron_logger.info("======== BEFORE CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  	UnprocessedDepartureMailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  end

end
