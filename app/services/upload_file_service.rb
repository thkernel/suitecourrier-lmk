module UploadFileService

    # Upload array of files
    def self.upload(files, record, options = {})
        if files.present?
            #Iterate files[]
            files.each do |file|
                checksum = Digest::MD5.hexdigest(File.read(file.tempfile.path))
                # Send upload
                response = $drive.upload_file(file.original_filename, path: file.tempfile.path, parent_id: options[:parent_id], checksum: checksum )

                # Insert Blob
                blob = DriveBlob.new
                blob.key = response.id
                blob.filename = response.name
                blob.content_type = response.mime_type
                blob.byte_size = File.size(file.tempfile.path)
                blob.checksum = checksum
                
            
                attachment_params = {name: file.original_filename, attachable: record }
                attachment = blob.build_drive_attachment(attachment_params)
            
                blob.save 
                
            end
        end
    end

    # Get files from drive
    def self.get_files(options = {})
        puts "OPTIONS PASSED: #{options}"
        $drive.list_files(options)
    end

   

end