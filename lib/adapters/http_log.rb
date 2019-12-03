# frozen_string_literal: true

require 'httplog'

module HttpLog
  class << self
    alias_method :orig_call, :call

    def call(options = {})
      orig_call(options)

      Lograge::HttpRequest.store[:lograge_http_requests] ||= []
      Lograge::HttpRequest.store[:lograge_http_requests] << options
    end
  end
end
