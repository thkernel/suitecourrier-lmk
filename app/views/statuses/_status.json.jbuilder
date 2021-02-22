json.extract! status, :id, :uid, :name, :description, :status, :user_id, :created_at, :updated_at
json.url status_url(status, format: :json)
