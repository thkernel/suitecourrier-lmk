require 'google/apis/drive_v3'
require "googleauth/stores/file_token_store"
require "fileutils"


class GoogleDrive

  OOB_URI = "http://localhost:3000/oauth2callback"
  APPLICATION_NAME = "geid".freeze
  CREDENTIALS_PATH = "./lib/google_drive/credentials.json".freeze
  TOKEN_PATH = "token.yaml".freeze
  SCOPE = ['https://www.googleapis.com/auth/drive'] # Full access
  #SCOPE = Google::Apis::DriveV3::AUTH_DRIVE_METADATA_READONLY
  attr_writer :authorizer, :drive, :redirect_uri, :credentials


  def initialize
    client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH #("#{Rails.root}/lib/google_drive/credentials.json")
    #scope = ['https://www.googleapis.com/auth/drive']
    
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    @authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    @credentials = @authorizer.get_credentials(user_id)
    @drive = Google::Apis::DriveV3::DriveService.new
    @drive.authorization = @credentials
  end

  def authorization_url
      @authorizer.get_authorization_url(base_url: OOB_URI)
  end
    
  def get_credentials
    @credentials
  end
    
  def set_authorization
    @drive.authorization = @credentials
  end
    
  def get_drive
    @drive
  end

  def save_credentials(code)
    user_id = 'default'
    @credentials = @authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
    @drive.authorization = @credentials
  end
    
  def list_files(options = {})
    @drive.list_files(options: options)
  end
    
  def uploadd(file, options = {})
    # file[:parent_ids] = [{id: 'id'}]
    file_obj = Google::Apis::DriveV3::File.new({
      title: file[:title],
      parents: file[:parent_ids]
    })
    f = @drive.insert_file(file_obj, upload_source: file[:path])
    f.id
  rescue
    nil
  end

  def upload_file(file, options = {})
    # file[:parent_ids] = [{id: 'id'}]
    parent_id = options[:parent_id]
    file_obj = Google::Apis::DriveV3::File.new
    file_obj.name = file
    file_obj.parents = [parent_id] if options[:parent_id].present?
    

    @drive.create_file(file_obj, upload_source: options[:path], fields: 'id') do |response, error|
      if error
        error
      else
        response
      end
    end
    
  
  end

  def download_file(file_id, options = {})
  
    @drive.get_file(file_id, download_dest: '/home/thekernel/projects/AMOS.txt') do |response, error|
      if error
        error
      else
        response
      end
    end
   
    puts "TEMP"
  end
  
  # Delete file.
  def delete(id, options = {})
    @drive.delete_file(id) do |response, error|
      if error
        error
      else
        response
      end
    end
  end


  # Update file.
  def update(id, file, options = {})
    @drive.patch_file(id, file) do |response, error|
      if error
        error
      else
        response
      end
    end
  end

  def get(id, options = {})
    @drive.get_file(id) do |response, error|
      if error
        error
      else
        response
      end
    end
  end

  def list_children_files(parent_id, options = {})
    @drive.list_children(parent_id, options: options).items
  end


  


  # Create a new folder.
  def create_folder(folder_name, options = {})
  
    parent_id = options[:parent_id]
    folder_obj = Google::Apis::DriveV3::File.new
    folder_obj.name = folder_name
    folder_obj.parents = [parent_id] if options[:parent_id].present?
    folder_obj.mime_type = 'application/vnd.google-apps.folder'

    @drive.create_file(folder_obj) do |response, error|
      if error
        error
      else
        response
      end
    end
  end

  # Create file.
  def create_file(file_name, options = {})
   
    parent_id = options[:parent_id]
    file_obj = Google::Apis::DriveV3::File.new
    file_obj.name = file_name
    file_obj.parents = [parent_id] if options[:parent_id].present?
    @drive.create_file(file_obj) do |response, error|
      if error
        error
      else
        response
      end
    end
    
    
  end

end