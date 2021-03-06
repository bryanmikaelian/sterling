module Sterling

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end

  class Configuration
    attr_accessor :api_version, :api_key, :api_host

    def initialize
      @api_version = '2.1'
      @api_key = nil
      @api_host = nil
    end
  end
end
