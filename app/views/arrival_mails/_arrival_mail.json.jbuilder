json.extract! arrival_mail, :id, :registry_id, :internal_reference, :external_reference, :departure_date, :receipt_date, :reference_departure_mail, :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :short_description, :attachments, :attachments_number, :status, :user_id, :created_at, :updated_at
json.url arrival_mail_url(arrival_mail, format: :json)
