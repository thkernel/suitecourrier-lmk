class AttachmentsController < ApplicationController
	before_action :authenticate_user!

	def delete
		puts "DELETING FILE: #{params.inspect}"
		file = ActiveStorage::Attachment.find(params[:id])
		file.purge
		puts "WOOW FILE: #{file.inspect}"
		#file.purge
	end


end