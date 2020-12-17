require 'google/apis/drive_v3'
require "googleauth/stores/file_token_store"
require "fileutils"


module GoogleDriveService
  class GoogleDrive
    
    attr_writer :authorizer, :drive, :redirect_uri, :credentials
        

    def initialize
      client_id = Google::Auth::ClientId.from_file GoogleDriveService.configuration.credentials_path
      token_store = Google::Auth::Stores::FileTokenStore.new file: GoogleDriveService.configuration.token_path
      @authorizer = Google::Auth::UserAuthorizer.new(client_id, GoogleDriveService.configuration.scope, token_store)
      user_id = 'default'
      @credentials = @authorizer.get_credentials(user_id)
      @drive = Google::Apis::DriveV3::DriveService.new
      @drive.authorization = @credentials
    
    end


    def authorization_url
        @authorizer.get_authorization_url(base_url: GoogleDriveService.configuration.oob_uri)
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
        user_id: user_id, code: code, base_url: GoogleDriveService.configuration.oob_uri)
      @drive.authorization = @credentials
    end
            
    def list_files(options = {})
      puts "OPTIONS: #{options}"
      @drive.list_files(options: options)
    end

    
    def upload_file(file, options = {})
      # file[:parent_ids] = [{id: 'id'}]
      parent_id = options[:parent_id]
      md5_checksum = options[:md5_checksum]
      file_obj = Google::Apis::DriveV3::File.new
      file_obj.name = file
      file_obj.parents = [parent_id] if options[:parent_id].present?
      file_obj.md5_checksum = md5_checksum if options[:md5_checksum].present?
      

      @drive.create_file(file_obj, upload_source: options[:path]) do |response, error|
        if error
          error
        else
          response
        end
      end
    end
      
    def download_file(file_id,   options = {})
    
    puts "FILE DEST: #{options[:file_name]}"
    download_dest = "#{Dir.tmpdir}/#{options[:file_name]}"

      @drive.get_file(file_id, download_dest: download_dest ) do |response, error|
        if error
          error
        else
          
          response
        end
      end

      puts "TEMP DIR: #{download_dest}"
      

    end
        
      
          
    def delete(id, options = {})
      @drive.delete_file(id) do |response, error|
        if error
          error
        else
          response
        end
      end
    end
      
    def update(id, file, options = {})
      glo = @drive.patch_file(id, file) do |response, error|
        if error
          error
        else
          response
        end
      end



      puts "HUMMM GLO: #{glo}"
    end
      
    def get(id, options = {})
      @drive.get_file(id) do |response, error|
        if error
          error
        else
         response.web_content_link
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

    # Return the content of the file at the +key+.
    def download(key)
      
    end

    # Return the partial content in the byte +range+ of the file at the +key+.
    def download_chunk(key, range)
      
    end

     # Return +true+ if a file exists at the +key+.
     def exist?(key)
      
    end

    def url(key, expires_in:, disposition:, filename:, content_type:)
      
    end

    def url_for_direct_upload(key, expires_in:, content_type:, content_length:, checksum:)
      
    end

    def web_content_link(key)
      @drive.web_content_link(key)
    end
  end
end