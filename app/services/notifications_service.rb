class NotificationsService
    
    #Create notification
    def self.notificate(recipient_id, resource, content)
        notification = Notification.new
        notification.recipient_id = recipient_id
        notification.content = content
        notification.notificable = resource
        notification.save
        #return notification
    end

end