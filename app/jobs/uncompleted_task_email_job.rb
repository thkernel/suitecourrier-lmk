class UncompletedTaskEmailJob < ApplicationJob
  #queue_as :default
  queue_as :uncompleted_task_email_job

  def perform
  	uncompleted_task_email
  end

  private

  def uncompleted_task_email

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    tasks = ImputationItem.where(completed: nil).where("due_date < ? ", compare_date)


    tasks.each do |task|
    	
    	# Send notification by email
      task.update_column(:completed, false)
    	ImputationsMailer.uncompleted_task_email(task).deliver_now

    	# Add in the notification queue
    end

  end
end
