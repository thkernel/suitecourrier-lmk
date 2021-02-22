json.extract! storage_area, :id, :uid, :name, :short_name, :maximum_size, :path, :description, :status, :user_id, :created_at, :updated_at
json.url storage_area_url(storage_area, format: :json)
