class UncompletedTaskJob < ApplicationJob
  #queue_as :default
  queue_as :uncompleted_task_job

  def perform(*args)
  	uncompleted_task
  end

  private

  def uncompleted_task

  	
    current_date = Time.now.strftime("%d/%m/%Y").to_date

    compare_date = current_date + 1.day
    tasks = ImputationItem.where(completed: nil).where("due_date < ? ", compare_date)


    tasks.each do |task|
    	
    	# Send notification by email
    	ImputationMailer.uncompleted_task_mail(task).deliver_now

    	# Add in the notification queue
    end

  end
end
