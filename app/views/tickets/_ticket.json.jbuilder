json.extract! ticket, :id, :title, :priority, :content, :due_date, :start_date, :completed_date, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
