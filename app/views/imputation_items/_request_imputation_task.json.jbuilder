json.extract! request_imputation_task, :id, :task_type_id, :title, :description, :start_date, :end_date, :closing_date, :task_status_id, :request_imputation_id, :user_id, :created_at, :updated_at
json.url request_imputation_task_url(request_imputation_task, format: :json)
