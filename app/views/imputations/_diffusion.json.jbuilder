json.extract! diffusion, :id, :reference, :service_id, :recipient, :arrival_mail_id, :status, :broadcast_by, :user_id, :created_at, :updated_at
json.url diffusion_url(diffusion, format: :json)
