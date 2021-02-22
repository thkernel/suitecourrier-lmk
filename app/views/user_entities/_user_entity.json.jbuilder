json.extract! user_entity, :id, :user_id, :status, :created_at, :updated_at
json.url user_entity_url(user_entity, format: :json)
