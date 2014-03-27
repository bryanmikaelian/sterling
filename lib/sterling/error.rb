module Sterling
  module Error

    class InvalidAPIVersion < StandardError; end

    class InvalidAPIKey < StandardError; end

    class InvalidAPIHost < StandardError; end

    class InvalidRequest < StandardError; end

    class MissingAPIConfiguration < StandardError; end

  end
end
