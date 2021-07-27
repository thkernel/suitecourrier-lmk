namespace :imputation do
  desc "TODO"
  task uncompleted_task_email: :environment do
  	
  	UncompletedTaskEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed uncompleted task, at: #{Time.now} ===========")
  end


  desc "overdue task"
  task uncompleted_task_warning_email: :environment do
  	
  	UncompletedTaskWarningEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: overdue task, at: #{Time.now} ===========")
  end

end
