# For subdmain.
class SubdomainConstraint   
  def self.matches?(request)     
    request.subdomain.present? && request.subdomain != 'www'   
  end 
end 


Rails.application.routes.draw do


  resources :tenants
  get 'quote-request' => 'quote_requests#new', :as => "new_quote_request"
  post 'quote-request' => 'quote_requests#create', :as => "create_quote_request"

  get 'demo-request' => 'demo_requests#new', :as => "new_demo_request"
  post 'demo-request' => 'demo_requests#create', :as => "create_demo_request"


  resources :ticket_statuses do   
    get "delete"
  end
  resources :storage_services
  resources :storage_service_settings
  resources :ticket_types do   
    get "delete"
  end
  resources :task_statuses do   
    get "delete"
  end
  resources :task_types do   
    get "delete"
  end
  resources :internal_memos do   
    get "delete"
  end
  resources :register_types do   
    get "delete"
  end
  resources :user_entity_items
  resources :user_entities do   
    get "delete"
  end
  resources :general_settings
  resources :storage_areas
  resources :smtp_server_settings
  resources :priorities do   
    get "delete"
  end
  resources :statuses do   
    get "delete"
  end

  resources :entities do   
    get "delete"
  end
  resources :entity_types do   
    get "delete"
  end
  resources :ticket_users
  resources :activity_logs

  get 'oauth2callback' => 'static_pages#set_google_drive_token'
  get 'static_pages/files' => 'static_pages#files'

  get "browse/:uid" => "folders#browse", :as => "browse"
  get "browse/:uid/new" => "folders#new", :as => "new_sub_folder"
  get "create_file" => "folders#create_file", as: :create_file
  
  get "folder/:uid/edit" => "folders#edit", as: :edit_folder
  get "folder/:uid/delete" => "folders#delete", as: :folder_delete
  get "/downloadfile/:key" => "folders#download_drive_file", as: :download_file
  

  get "configurations" => "configurations#show", as: :configurations

  get "/get/last_folder" => "folders#last_folder"
  resources :folders , except: [:edit] do


  end

  

  resources :tickets do   
    get "delete"
  end
  
  scope "settings" do
    resources :configs, except: [:show]
    get "smtp" => "configs#smtp_configs", as: :smtp_configs
    get "smtp/new" => "configs#new_smtp_config", as: :new_smtp_config
    get "smtp/edit/:id" => "configs#edit_smtp_config", as: :edit_smtp_config
  end

  scope "account" do 
    resources :profiles 
    get "profile/:uid" => "profiles#edit", as: :edit_account
  end

 
  get "custom_users/get_entities" => "custom_users#get_entities"
  get "imputations/get_profiles" => "imputations#get_profiles"

    
  


  
  resources :notifications
  resources :comments
  
  resources :documents do   
    get "delete"

    collection do    
      get "get_natures" => "documents#get_natures"
      get "get_folders" => "documents#get_folders"
      get "get_supports" => "documents#get_supports"
    end

  end
  
  resources :task_time_trackings do   
    get "delete"
  end
  resources :divisions do   
    get "delete"
  end
  resources :directions do   
    get "delete"
  end
  resources :imputation_items do   
    get "delete"
  end

  resources :imputations, except: [:edit] do   
    get "delete"
    
  end
  post "imputations/new"
  #get "imputations/new", controller: "imputations", action: :new
  #post "imputations/new", controller: "imputations", action: :create




  get "imputation/show/:uid" => "imputations#show", as: :show_imputation
  get "imputation/edit/:uid" => "imputations#edit", as: :edit_imputation
  get "arrival-mail/show/:uid" => "arrival_mails#show", as: :show_arrival_mail
  get "departure-mail/show/:uid" => "departure_mails#show", as: :show_departure_mail
  get "document/show/:uid" => "documents#show", as: :show_document
  get "request/show/:uid" => "requests#show", as: :show_request
  get "/settings/smtp" => "smtp_configurations#settings", as: :smtp_settings
  get "setup/organization" => "organizations#setup", as: :setup_organization

 
 
  #root 'home#index'
  # Home route.
  root to: "front#home"
  
  resources :tenants do   
    get "delete"
  end
  
  resources :tasks do    
    get "delete"

   
  end

  resources :registers do    
    get "delete"
  end

 

  resources :task_statuses do    
    get "delete"
  end

  
  
  
  resources :departure_mails do     
    get "delete"
    get "archive" 
    get "archives"
    
    collection do    
      get "get_reference" => "departure_mails#get_reference"
    end
  end

  resources :attachments
  resources :arrival_mails , except: [:show] do   
    get "delete"
    get "archive"
    get "archives"

    
    collection do    
      get "get_reference" => "arrival_mails#get_reference"
    end

    collection do    
      get "get_natures" => "arrival_mails#get_natures"
      get "get_folders" => "arrival_mails#get_folders"
      get "get_supports" => "arrival_mails#get_supports"
      get "get_correspondents" => "arrival_mails#get_correspondents"
    end
  end

  
  resources :options

  get "/get/last_correspondent" => "correspondents#last_correspondent"
  resources :correspondents do    
    get "delete"
  end
  
  resources :correspondent_types do   
    get "delete"
  end
  

 
  
  

  resources :features do   
    get "delete"
  end

  resources :services do   
    get "delete"
  end
  get "settings/company/:uid" => "organizations#show", as: :show_organization
  get "settings/company/:uid/edit" => "organizations#edit", as: :edit_organization

  resources :organizations, except: [:show, :edit] do      
    get "delete"
  end
  
  resources :folders do   
    get "delete"
  end

  resources :binders do   
    get "delete"
  end

  
  
  resources :organization_types do     
    get "delete"
  end

 

  get "request/new" => "requests#new_front_request" , as: :new_front_request
  get "request-success" => "requests#front_request_success" , as: :front_request_success
	#post "/companies/new/" => "companies#create", as: :create_company
	#get "/companies/new/" => "companies#new", as: :new_company
	#get "/organization/:id" => "organizations#show", as: :show_organization
	#get "/companies/edit/:id" => "companies#edit", as: :edit_company
	#patch "/companies/:id"  => "companies#update", as: :company


  get "/get/last_nature" => "natures#last_nature"
  resources :natures do     
    get "delete"

    
  end
  

  get "/get/last_support" => "supports#last_support"
  resources :supports do      
    get "delete"
  end

  resources :registries do     
    get "delete"
  end

  
  
  #devise_for :users
  resources :permissions do   
    get "delete"
  end
  resources :roles do  
    get "delete"
  end

  get "/dashboard" => "dashboard#index" , as: :dashboard

  #get "/register" => "registrations#register", as: :registration

  get "arrival_mails/bulk_archive/modal/" => "arrival_mails#bulk_archive_modal", as: :arrival_mails_bulk_archive_modal
  post "arrival_mails/bulk_archive" => "arrival_mails#bulk_archive", as: :arrival_mails_bulk_archive


  get "/departure_mails/bulk_archive/modal/" => "departure_mails#bulk_archive_modal", as: :departure_mails_bulk_archive_modal
  post "/departure_mails/bulk_archive" => "departure_mails#bulk_archive", as: :departure_mails_bulk_archive

  get "archives/arrival_mails" => "arrival_mails#archives", as: :arrival_mails_archives
  get "archives/departure_mails" => "departure_mails#archives", as: :departure_mails_archives

  get "arrival_mail/to_archive/:id" => "arrival_mails#to_archive", as: :arrival_mail_to_archive
  get "departure_mail/to_archive/:id" => "departure_mails#to_archive", as: :departure_mail_to_archive

  #get "arrival/mail/:id/imputations" => "imputations#index" , as: :arrival_mail_imputations
  get "arrival/mail/:id/tasks" => "tasks#index" , as: :arrival_mail_tasks
  #get "imputation/:id/tasks" => "tasks#index" , as: :imputation_tasks
  get "taks/all" => "tasks#search_tasks", as: :search_tasks

  get "/users"     => "custom_users#index", as: :all_users 
	get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
	post "/users/new"     => "custom_users#create", as: :create_user
	get "/users/new"     => "custom_users#new", as: :new_user
	get "/user/edit/:id" => "custom_users#edit", as: :edit_user
	patch "/user/update/:id" => "custom_users#update", as: :update_user
	delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
  
  get "/setup/admin" => "admin_setup#new", as: :new_admin
  post "/setup/admin/create" => "admin_setup#create", as: :create_admin
  get "utilities/backup" => "utilities#show_backup", as: :show_backup
  post 'utilities/backup' => "utilities#backup_database", as: :backup_database


	get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account
	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
	post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account


  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
    }
   
    devise_scope :user do
      root to: "users/sessions#new"
      authenticated :user do
        root 'dashboard#index', as: :authenticated_root
      end
  
      unauthenticated do
        root 'users/sessions#new', as: :unauthenticated_root
      end
    end


    # Dynamic error pages
    get "/404", to: "errors#not_found"
    get "/422", to: "errors#unacceptable"
    get "/500", to: "errors#internal_error"

    mount Ckeditor::Engine => '/ckeditor'
  

end