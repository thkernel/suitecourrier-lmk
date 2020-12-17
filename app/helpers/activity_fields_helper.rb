module ActivityFieldsHelper
    def activity_field_name(id)

        if id.present?
            ActivityField.find(id).name
        end
        
    end

end
