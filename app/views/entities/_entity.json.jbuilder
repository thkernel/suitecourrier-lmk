json.extract! entity, :id, :uid, :parent_entity_id, :entity_type_id, :name, :short_name, :phone, :email, :address, :description, :status, :user_id, :created_at, :updated_at
json.url entity_url(entity, format: :json)
