json.extract! task_status, :id, :uid, :name, :description, :status, :user_id, :created_at, :updated_at
json.url task_status_url(task_status, format: :json)
