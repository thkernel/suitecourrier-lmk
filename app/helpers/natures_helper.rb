module NaturesHelper
    def nature(id)

        if id.present?
            Nature.find(id)
        end
        
    end

end
