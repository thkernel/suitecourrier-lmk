module RolesHelper
    def role_name(id)
        role = Role.find(id).name
    end
end
