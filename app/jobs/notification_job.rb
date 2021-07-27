class NotificationJob < ApplicationJob
  queue_as :notification_job

  def perform(user_id, imputation, resource, imputable_type)

    notification(user_id, imputation, resource, imputable_type)
  end

 

  def notification(user_id, imputation, resource, imputable_type)
  	  	message = "Un #{imputable_type} vous a été imputé. Réf: #{imputation.imputable_id}"
  	  	notification = Notification.new
        notification.recipient_id = user_id
        notification.content = message
        notification.notificable = resource
        notification.save
  end

  def snake_case(camel_case_string)
	    #gsub(/::/, '/').
	    camel_case_string.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
	    gsub(/([a-z\d])([A-Z])/,'\1_\2').
	    tr('-', '_').
	    gsub(/\s/, '_').
	    gsub(/__+/, '_').
	    downcase
  	end
end
