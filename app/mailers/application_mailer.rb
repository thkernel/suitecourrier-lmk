class ApplicationMailer < ActionMailer::Base
  default from: "#{Config.take.smtp_user_name if Config.take}"
  layout 'mailer'
end
