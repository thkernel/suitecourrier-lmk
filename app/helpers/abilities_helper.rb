module AbilitiesHelper

    def role(id)
        Role.find(id)
    end

    def feature(id)
        Feature.find(id)
    end
end
