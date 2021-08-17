require 'fileutils'

module SharedUtils

    # For model
    module Model
        
        def before_save_hook
            self.status = "Enable"
        end


    end


    module AppLogger
        def cron_logger
            @@cron_logger ||= Logger.new("#{Rails.root}/log/cron-log.log")
        end

        
    
    end


    module SmtpSettings
        def set_mailer_settings
    
            smtp_config = SmtpServerSetting.take

                if smtp_config.present?
                    ActionMailer::Base.smtp_settings.merge!({
                        :host => smtp_config.host ,
                        :address => smtp_config.address , 
                        :port => smtp_config.port,
                        :domain => smtp_config.domain,
                        :authentication => smtp_config.authentification,
                        :user_name => smtp_config.user_name,
                        :password => smtp_config.user_password,
              :enable_starttls_auto => smtp_config.enable_starttls_auto,
              :ssl => smtp_config.ssl,
              :openssl_verify_mode => 'none'
                    })
                    
                end
        end


        def set_contact_mailer_settings
    
            smtp_config = SmtpServerSetting.new
            smtp_config.host = "mail.suitecourrier.com"
            smtp_config.address = "suitecourrier.com"
            smtp_config.domain = "suitecourrier.com"
            smtp_config.authentification = "plain"
            smtp_config.user_name = "request@suitecourrier.com"
            smtp_config.user_password = "Root@2021@#!*"
            smtp_config.enable_starttls_auto = true
            smtp_config.ssl = ""
            
            puts "DEMO REQUEST SMTP SETTING: #{smtp_config.inspect}"

            
            ActionMailer::Base.smtp_settings.merge!({
                :host => smtp_config.host ,
                :address => smtp_config.address , 
                :port => smtp_config.port,
                :domain => smtp_config.domain,
                :authentication => smtp_config.authentification,
                :user_name => smtp_config.user_name,
                :password => smtp_config.user_password,
                :enable_starttls_auto => smtp_config.enable_starttls_auto,
                :ssl => smtp_config.ssl,
                :openssl_verify_mode => 'none'
            })

            
                
            #return smtp_config

        end
    
    end
    
    # For model
    module Generate
        
        def generate_random_number_uid
            current_record = self
          
            if current_record.present?
                unless current_record.uid.present? 
                    begin
                        current_record.uid = SecureRandom.random_number(100_000_000_000)
                    end while current_record.class.where(uid: current_record.uid).exists?
                end
            end
        end

        def generate_hex_uid
            current_record = self
          
            if current_record.present?
                unless current_record.uid.present? 
                    begin
                        current_record.uid = SecureRandom.hex(32)
                    end while current_record.class.where(uid: current_record.uid).exists?
                end
            end
        end

        
    end

    module  Folder

        # Create a folder

        def create_folder(folder)
            unless File.exists?(folder) 
                #Dir.mkdir(folder)
                FileUtils.mkdir_p(folder)

            else
                puts "Folder exist!"
            end
        end

        
    end


end