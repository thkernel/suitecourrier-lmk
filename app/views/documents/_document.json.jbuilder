json.extract! document, :id, :support_id, :nature_id, :name, :description, :status, :user_id, :created_at, :updated_at
json.url document_url(document, format: :json)
