module SupportsHelper
    def support_name(id)

        if id.present?
            Support.find(id).name
        end
        
    end


end
