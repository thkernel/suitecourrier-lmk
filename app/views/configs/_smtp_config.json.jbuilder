json.extract! smtp_config, :id, :host, :user_name, :password, :domain, :address, :port, :authentification, :enable_starttls_auto, :ssl, :user_id, :created_at, :updated_at
json.url smtp_config_url(smtp_config, format: :json)
