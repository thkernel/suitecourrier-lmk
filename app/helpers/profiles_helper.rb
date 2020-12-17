module ProfilesHelper

    def profile(id)
        Profile.find(id)
    end
end
