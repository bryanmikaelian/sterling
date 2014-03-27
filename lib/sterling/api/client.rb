module Sterling
  module API
    class Client
      
      attr_reader :base_url, :conn, :config

      def initialize
        @config = self.verify_config(Sterling.configuration)
        @base_url = "#{host}.retailigence.com/v#{version}/" 
        @conn = Faraday.new(url: "http://#{@base_url}")
      end

      def products(user_location, query)
        params = { user_location: user_location, keywords: query }
        Product.search(self, params)
      end

      protected 

      def host
        if self.valid_api_host?(@config.api_host)
          @config.api_host
        else
          raise Sterling::Error::InvalidAPIHost
        end
      end

      def version
        if self.valid_api_version?(@config.api_version)
          @config.api_version
        else
          raise Sterling::Error::InvalidAPIVersion
        end
      end

      def valid_api_version?(version)
        ['2.1'].include?(version)
      end

      def valid_api_host?(host)
        ['apitest', 'api'].include?(host)
      end

      def invalid_path
        {error: 'Invalid path'}
      end

      def verify_config(config)
        if config.api_version.nil? || config.api_key.nil? || config.api_host.nil? || config.retailer_id.nil?
          raise Sterling::Error::MissingAPIConfiguration.new('Invalid configuration')
        else
          config
        end
      end
    end
  end
end
