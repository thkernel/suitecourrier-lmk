json.extract! task_type, :id, :uid, :name, :description, :status, :user_id, :created_at, :updated_at
json.url task_type_url(task_type, format: :json)
