module RequestsHelper
    def request_type(request_type_id)
        RequestType.find(request_type_id)
    end
end
