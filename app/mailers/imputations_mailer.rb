class ImputationsMailer < ActionMailer::Base
    include SharedUtils::SmtpSettings

    before_action :set_mailer_settings

    #include SmtpHelper
    helper :application
        
    add_template_helper EmailHelper
    #add_template_helper ApplicationHelper
    #default from: "<salut.amos@gmail.com>"
    default from: "SuiteCourrier<#{SmtpServerSetting.take.user_name}>" if SmtpServerSetting.take.present?

    def new_imputation_mail(user_id, imputation)
        @user = User.find(user_id)
        @imputation = imputation
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Nouvelle imputation")
    end


    def uncompleted_task_mail(task)

        imputation = Imputation.find(task.imputation_id)
        @user = User.find(imputation.recipient_id)
        @task = task
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "Tâche non traitée!")
    end

    def check_task_due_date_mail(task)

        imputation = Imputation.find(task.imputation_id)
        @user = User.find(imputation.recipient_id)
        @task = task
        
        
        @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
        mail(to: @user.email, subject: "La date limite de traitement d'une tâche expirera bientôt!")
    end

   

    
end