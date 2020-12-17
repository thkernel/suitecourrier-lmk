class StaticPagesController < ApplicationController
  authorize_resource
    
    def set_google_drive_token
      if request['code'] == nil
        redirect_to($drive.authorization_url)
      else
        $drive.save_credentials(request['code'])
        redirect_to('/')
      end
    end

    def files 
      render json: { list_files: $drive.list_files }
    end
  end