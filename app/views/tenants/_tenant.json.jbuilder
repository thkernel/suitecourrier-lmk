json.extract! tenant, :id, :organization_type_id, :organization_name, :address, :phone, :city, :phone, :email, :website, :subdomain, :status, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
