module Sterling
  module API
    class Product
      attr_reader :product, :distance, :location, :inventory, :price, :currency, :inventory, :lastUpdated

      def self.search(client, params)
        return [] unless  params[:keywords] && params[:user_location] && params[:requestor_id]

        response = client.conn.get do |req|
          req.url 'products'
          req.params['apikey'] = client.config.api_key
          req.params['userlocation'] = params[:user_location]
          req.params['requestorid'] = params[:requestor_id]
          req.params['keywords'] = params[:keywords]
        end

        parsed = JSON.parse(response.body)

        if parsed['RetailigenceSearchResult']['results'] && parsed['RetailigenceSearchResult']['results'].size > 0
          products = parsed['RetailigenceSearchResult']['results'].map do |product|
            Product.new(product['SearchResult'])
          end
        else
          []
        end
      end

      def initialize(object)
        object.each do |k,v|
          self.class.class_eval { attr_reader k.to_sym }
          instance_variable_set "@#{k}", object[k]
        end
      end
    end
  end
end
