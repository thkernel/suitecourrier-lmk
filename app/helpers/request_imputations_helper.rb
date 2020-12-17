module RequestImputationsHelper
    def service(service_id)
        Service.find(service_id)
    end
end
