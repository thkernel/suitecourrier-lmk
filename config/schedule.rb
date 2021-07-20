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
 every 5.minutes, :roles =>[:db, :app, :web] do
    rake "arrival_mail:check_arrival_mail_processing_deadline"
    rake "departure_mail:check_departure_mail_processing_deadline"
    rake "imputation:check_task_due_date"
    rake "arrival_mail:unprocessed_arrival_mail"
    rake "departure_mail:unprocessed_departure_mail"
    rake "imputation:uncompleted_task"
    #rake "tasks:calculate_bank_commission_rate_evolution"
    #rake "tasks:check_first_installment_payment_delay_expired"
    #rake "tasks:check_monthly_installment_payment_delay_expired"
end


#every 2.minutes do
    #rake "arrival_mail:unprocessed_arrival_mail"
    #rake "tasks:calculate_bank_commission_rate_evolution"
    #rake "tasks:check_first_installment_payment_delay_expired"
    #rake "tasks:check_monthly_installment_payment_delay_expired"
#end