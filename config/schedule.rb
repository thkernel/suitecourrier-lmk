# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever




#every 1.day, at: '4:30 am' do
#  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
#end


# For capistrano on the server
 every 30.minutes, :roles =>[:db, :app, :web] do

    # Arrival mail
    rake "arrival_mail:arrival_mail_processing_warning_email"
    rake "arrival_mail:unprocessed_arrival_mail_email"
    

    # Departure mail
    rake "departure_mail:departure_mail_processing_warning_email"
    rake "departure_mail:unprocessed_departure_mail_email"

    # Imputations
    rake "imputation:uncompleted_task_warning_email"
    rake "imputation:uncompleted_task_email"
    
    
    # Tickets
    rake "ticket:uncompleted_ticket_warning_email"
    rake "ticket:uncompleted_ticket_email"
    
end


#every 2.minutes do
    #rake "arrival_mail:unprocessed_arrival_mail"
    #rake "tasks:calculate_bank_commission_rate_evolution"
    #rake "tasks:check_first_installment_payment_delay_expired"
    #rake "tasks:check_monthly_installment_payment_delay_expired"
#end