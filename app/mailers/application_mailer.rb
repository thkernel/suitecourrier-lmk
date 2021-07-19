class ApplicationMailer < ActionMailer::Base
  #default from: "salut.amos@gmail.com"
  default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?
  layout 'mailer'
end
