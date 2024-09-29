module ApplicationHelper
	# Include all helpers
	include CorrespondentsHelper
	include RegistersHelper
	include MetaTagsHelper

    def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
	end
	
	def resource_class
		User
	end
	
	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	end


	def task_completed?(task_status_id)
		if task_status_id == TaskStatus.find_by(name: "Terminée").id
			true
		end
	end


	def unreaded_notification?(notification)
		if notification.readed_at.present?
			false
		else
			true
		end
	end


	def get_tenant_status?(subdomain)
		tenant = Tenant.find_by(name: subdomain)

		if tenant.present? #&& tenant.status == true
			true 
		else
			#false
			true #for test
		end
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


	def devise_title(controller)
		if controller == "sessions"
			t(:login)
		elsif controller == "registrations"
			t('sign_up')

		elsif controller == "admin_setup"
			t(:admin_setup)
		end
	end

	def application_page_title(controller, action)
		if controller == "home" && action == "index"
			t(:application_home_page)
		end
	end

	def current_organization
	
		organization = Organization.take
		
	end

	def get_user(user_id)
		user = User.find(user_id)
	end

	def priority(id)
		Priority.find(id)
	end

	def task_status(id)
		TaskStatus.find(id)
	end
	
	def user_notifications
		current_user.recipient_notifications.where(readed_at: nil).order(created_at: 'DESC').take(5)
	end

	def imputable_type(imputation)
		if imputation.imputable_type == "ArrivalMail"
			ArrivalMail.find(imputation.imputable_id).internal_reference
		elsif imputation.imputable_type == "Document"
			Document.find(imputation.imputable_id).uid

		end
	end

	def arrival_mail_register_type?(selected_register_type)
		if selected_register_type === "Registre arrivée"
			true
		else
			false
		end
	end

	def departure_mail_register_type?(selected_register_type)
		if selected_register_type === "Registre départ"
			true
		else
			false
		end
	end

	def arrival_mail_total_task(id)
		arrival_mail = ArrivalMail.find(id)
		total_task = 0
		total_task = arrival_mail.imputations.map {|item| item.imputation_items.count}.sum
	end

	def arrival_mail_total_completed_task(id)
		arrival_mail = ArrivalMail.find(id)
		total_task = 0
		total_task = arrival_mail.imputations.map {|item| item.imputation_items.completed.count}.sum
	end

	# 
	def arrival_mail_total_uncompleted_task(id)
		
	end



	def last_arrival_mail()
		#Get year
		year = Time.now.year 

		last_arrival_mail = ArrivalMail.where(year: year).last

		puts "LAST ARRIVAL MAIL: #{last_arrival_mail.inspect} "

		if last_arrival_mail.present? 
      		id = last_arrival_mail.id
      		id_str = id.to_s
      		puts "A: #{id}"
      
	      if id_str.size == 1
	        @internal_reference = "000#{last_arrival_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      elsif id_str.size == 2
	        @internal_reference = "00#{last_arrival_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      elsif id_str.size == 3
	        @internal_reference = "0#{last_arrival_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      elsif id_str == 4
	        @internal_reference = "#{last_arrival_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      end
	    else
	      
	      @internal_reference = "0001|#{Time.new.month}|#{Time.new.year}"
	    end


	end


	def last_departure_mail
		#Get year
		year = Time.now.year 

		last_departure_mail = DepartureMail.where(year: year).last

    	if last_departure_mail.present? 
      		id_str = last_departure_mail.id.to_s
      
	      	if id_str.size == 1
	        	@internal_reference = "000#{last_departure_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      	elsif id_str.size == 2
	        	@internal_reference = "00#{last_departure_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      	elsif id_str.size == 3
	        	@internal_reference = "0#{last_departure_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      	elsif id_str == 4
	        	@internal_reference = "#{last_departure_mail.id+1}|#{Time.new.month}|#{Time.new.year}"
	      	end
	    else
      
	      	@internal_reference = "0001|#{Time.new.month}|#{Time.new.year}"
	    	
	    end
	 end


	def is_account_locked?(user)
		if user.status == 'enable'
			false
		else
			true
		end
	end

	def configs?
		configs = Config.take

		if configs.present? 
			true
		else
			false
		end
	end

	def smtp_config?
		config = SmtpServerSetting.take

		if config.present? 
			true 
		else
			false
		end
	end

	def current?(key, path)
		"#{key}" if current_page? path
		# We use string interpolation "#{key}" here to access the CSS classes we are going to create.
	 end

	def has_general_settings?
	 	settings = GeneralSetting.first
	 	if settings.present?
	 		true
	 	else
	 		false
	 	end
	 end

	 def has_smtp_server_settings?
	 	smtp_server = SmtpServerSetting.first
	 	if smtp_server.present?
	 		true
	 	else
	 		false
	 	end
	 end


	 def has_storage_area?
	 	storage_area = StorageArea.first
	 	if storage_area.present?
	 		true
	 	else
	 		false
	 	end
	 end


	 def has_storage_service_setting?
	 	storage_service_setting = StorageServiceSetting.first
	 	if storage_service_setting.present?
	 		true
	 	else
	 		false
	 	end
	 end

	 def has_organization?
	 	organization = Organization.first
	 	if organization.present?
	 		true
	 	else
	 		false
	 	end
	 end


	 def display_segment( node )
    
	    html = "<li>"
	    node_class = node.children.length == 0 ? "file" : "folder"
	   
	    html << "<span class='#{node_class}'>#{h(node.name)} </span>"
	   
	    html << "<ul id=\"children_of_#{h(node.id)}\">"
	 
	    node.children.each{|child_node|
	     
	      html << display_segment( child_node ) 
	    }
	    html << "</ul></li>"
	    
	  end

end
