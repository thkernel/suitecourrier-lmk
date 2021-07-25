module SidebarMenusHelper

    def sidebar_menu 
        if current_user.role.name == "superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_user.role.name == "administrator"
            render "layouts/partials/dashboard/navs/admin-nav"
        elsif current_user.role.name == "Patient"
            render "layouts/partials/dashboard/navs/patient-nav"
       

        


        end

    end

end