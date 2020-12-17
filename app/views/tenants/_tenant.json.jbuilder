json.extract! tenant, :id, :name, :domain, :status, :user_id, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
