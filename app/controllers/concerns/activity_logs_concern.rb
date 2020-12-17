module ActivityLogsConcern
    extend ActiveSupport::Concern 

   
		
	def record_activity(note)
		activity = ActivityLog.new
		activity.user_id = current_user.id
		activity.note = note
		activity.browser = request.env['HTTP_USER_AGENT']
		activity.ip_address = request.env['REMOTE_ADDR']
		activity.controller = controller_name 
		activity.action = action_name 
		activity.params = params.inspect
		activity.save
	end

end