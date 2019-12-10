# frozen_string_literal: true

require 'httplog'

module HttpLog
  class << self
    alias_method :orig_call, :call

    def call(options = {})
      orig_call(options)
      lograge_http_requests = options.dup
      lograge_http_requests[:response_body] =
        begin
          HttpLog.parse_body(
            options[:response_body],
            options[:encoding],
            options[:content_type]
          )
        rescue BodyParsingError => e
          "Response: #{e.message}"
        end

      Lograge::HttpRequest.store[:lograge_http_requests] ||= []
      Lograge::HttpRequest.store[:lograge_http_requests] << lograge_http_requests
    end
  end
end
