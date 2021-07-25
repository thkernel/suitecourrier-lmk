module CorrespondentsHelper

    def correspondent_name(id)
       
            correspondent = Correspondent.find(id)
            if correspondent.present? && correspondent.organization_name.present?
            	correspondent.organization_name
            else
            	"#{correspondent.contact_last_name} #{correspondent.contact_first_name}"

            end
       
    end
end
