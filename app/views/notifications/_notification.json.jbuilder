json.extract! notification, :id, :type, :recipient_id, :content, :status, :read_at, :created_at, :updated_at
json.url notification_url(notification, format: :json)
