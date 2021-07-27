class UncompletedTaskWarningEmailJob < ApplicationJob
  queue_as :uncompleted_task_warning_email_job

  def perform
  	uncompleted_task_warning_email

  end

  private 

  def uncompleted_task_warning_email
  	current_date = Time.now.strftime("%d/%m/%Y").to_date
  	
  	#(Time.now - self.created_at) / 86400 (nombre de seconde par jour)

  	#current_date = "17/07/2021".to_date

    compare_date = current_date + 1.day
    tasks = ImputationItem.where(processed: nil)#.where("processing_deadline < ? ", compare_date)


    tasks.each do |task|
    	due_date = task.due_date.strftime("%d/%m/%Y").to_date
    	date_diff = (due_date - current_date).to_i

    	if date_diff >= 1
	    	# Send notification by email
	    	ImputationsMailer.uncompleted_task_warning_email(task).deliver_now

    	end
    end
  end
end
