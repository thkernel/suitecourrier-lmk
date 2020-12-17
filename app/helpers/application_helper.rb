module ApplicationHelper
	# Include all helpers
	include CorrespondentsHelper
	include BindersHelper
	include RegistersHelper

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


	def get_tenant_status?(subdomain)
		tenant = Tenant.find_by(name: subdomain)

		if tenant.present? #&& tenant.status == true
			true 
		else
			#false
			true #for test
		end
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
	
		organization = current_user.organization
		if organization.present?
			organization
		end
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
		current_user.recipient_notifications.order(created_at: 'DESC').take(5)
	end

	def imputable_type(imputation)
		if imputation.imputable_type == "ArrivalMail"
			"Réf. courrier: #{ArrivalMail.find(imputation.imputable_id).internal_reference}"
		elsif imputation.imputable_type == "Request"
			"Réf. demande: #{Request.find(imputation.imputable_id).uid}"

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
		config = Config.take

		if config.present? && config.smtp_user_name.present? &&  config.smtp_user_password.present? && 
			config.smtp_address.present? && config.smtp_port
		
			true 
		else
			false
		end
	end

	def current?(key, path)
		"#{key}" if current_page? path
		# We use string interpolation "#{key}" here to access the CSS classes we are going to create.
	 end

end
