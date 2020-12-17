
require_relative "service/google_drive_service"
require_relative "configuration/configuration"

module GoogleDriveService
    class << self
        attr_accessor :configuration
    end
    
    def self.configuration
        @configuration ||= Configuration.new
    end
    
    def self.configure
        yield(configuration)
    end
end