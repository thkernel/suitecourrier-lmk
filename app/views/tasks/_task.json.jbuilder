json.extract! task, :id, :title, :short_description, :start_date, :end_date, :status, :diffusion_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
