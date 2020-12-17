GoogleDriveService.configure do |config|
    config.oob_uri = "http://localhost:3000/oauth2callback"
    config.application_name = "geid"
    config.credentials_path = "./lib/google_drive/credentials.json"
    config.token_path = "token.yaml"
    config.scope = ['https://www.googleapis.com/auth/drive','https://www.googleapis.com/auth/drive.file','https://www.googleapis.com/auth/drive.metadata']
end

$drive = GoogleDriveService::GoogleDrive.new
