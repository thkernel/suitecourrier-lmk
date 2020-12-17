module ServicesHelper

    def division(id)
        if id.present?
            Division.find(id)
        end
    end




end
