namespace :ticket do
  desc "Overdue ticket"
  task uncompleted_ticket_warning_email: :environment do
  	
  	UncompletedTicketWarningEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: overdue ticket due date, at: #{Time.now} ===========")
  end

  task uncompleted_ticket_email: :environment do
  	
  	UncompletedTicketEmailJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: overdue ticket due date, at: #{Time.now} ===========")
  end

end
