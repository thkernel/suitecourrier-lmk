json.extract! request, :id, :request_type_id, :first_name, :last_name, :gender, :born_date, :born_place, :academic_year, :grade, :specialty, :request_date, :description, :status, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)
