module UsersHelper
    def current_user_avatar(width)
        profile = current_user.profile

           
        if profile.present? && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else

            image_tag 'thumb/missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
     
    end

    def user_avatar(user_id, width)
        profile = User.find(user_id).profile

           
        if profile.present? && profile.avatar.attached?
            image_tag profile.avatar,  class: "wd-#{width} rounded-circle", alt: "Avatar"
        else

            image_tag 'thumb/missing.png',  class: "wd-#{width} rounded-circle", alt: "Avatar"
        end
     
    end
end