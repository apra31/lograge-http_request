# frozen_string_literal: true

module Lograge
  module HttpRequest
    # Module used to extend Lograge
    module Extension
      # Overrides `Lograge::RequestLogSubscriber#extract_request` do add HTTP requests
      def extract_request(event, payload)
        super.merge!(extract_http_requests)
      end

      # Collects all HTTP requests stored in the Thread during request processing
      def extract_http_requests
        http_requests = Lograge::HttpRequest.store[:lograge_http_requests]
        return {} unless http_requests

        Lograge::HttpRequest.store[:lograge_http_requests] = nil
        {
          http_requests: http_requests,
          http_requests_count: http_requests.length
        }
      end
    end
  end
end


if defined?(Lograge::RequestLogSubscriber)
  Lograge::RequestLogSubscriber.prepend Lograge::HttpRequest::Extension
else
  Lograge::LogSubscribers::ActionController.prepend Lograge::HttpRequest::Extension
end
