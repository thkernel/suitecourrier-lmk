module OrganizationsHelper
    def organization_type(organization_type_id)
        OrganizationType.find(organization_type_id)
    end
end
