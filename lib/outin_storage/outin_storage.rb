require_relative "config/configuration"

module OutinStorage
   

    def self.configuration
        @configuration ||= Configuration.new
    end

    def self.configure
        yield(configuration)
    end


end