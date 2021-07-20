namespace :imputation do
  desc "TODO"
  task uncompleted_task: :environment do
  	
  	UncompletedTaskJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: unprocessed uncompleted task, at: #{Time.now} ===========")
  end


  desc "check task due date"
  task check_task_due: :environment do
  	
  	CheckTaskDueDateJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: check task due date, at: #{Time.now} ===========")
  end

end
