json.extract! departure_mail, :id, :registry_id, :internal_reference, :external_reference, :departure_date, :reference_arrival_mail, :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :short_description, :attachments, :attachments_number, :status, :user_id, :created_at, :updated_at
json.url departure_mail_url(departure_mail, format: :json)
