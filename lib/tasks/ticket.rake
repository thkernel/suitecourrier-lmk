namespace :ticket do
  desc "Overdue ticket"
  task overdue_ticket: :environment do
  	
  	OverdueTicketJob.perform_now
  	
  	cron_logger.info("======== AFTER CRON: overdue ticket due date, at: #{Time.now} ===========")
  end

end
