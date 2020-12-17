json.extract! attachment, :id, :name, :link, :status, :binder_id, :user_id, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
