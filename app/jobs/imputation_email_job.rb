class ImputationEmailJob < ApplicationJob
  queue_as :imputation_email_job

  def perform(user_id, imputation)
    imputation_email(user_id, imputation)
  end

  

  def imputation_email(user_id, imputation)

  	ImputationsMailer.imputation_email(user_id, imputation).deliver_later
  end
end
