json.extract! ticket_user, :id, :uid, :ticket_id, :recipient_id, :created_at, :updated_at
json.url ticket_user_url(ticket_user, format: :json)
