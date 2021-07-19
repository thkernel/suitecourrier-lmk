namespace :imputation do
  desc "TODO"
  task uncompleted_task: :environment do
  	# Do
  	cron_logger.info("======== BEFORE CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  	UncompletedTaskJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed arrival mail, at: #{Time.now} ===========")
  end

end
