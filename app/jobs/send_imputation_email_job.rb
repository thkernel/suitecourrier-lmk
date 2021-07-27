class SendImputationEmailJob < ApplicationJob
  queue_as :send_imputation_email_job

  def perform(user_id, imputation)
    send_imputation_email(user_id, imputation)
  end

  private

  def send_imputation_email(user_id, imputation)

  	ImputationsMailer.new_imputation_mail(user_id, imputation).deliver_later
  end
end
