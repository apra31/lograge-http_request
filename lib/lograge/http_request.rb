# frozen_string_literal: true

require 'lograge/http_request/version'

module Lograge
  # Main gem module
  module HttpRequest
    class << self
      def store
        defined?(RequestStore) ? RequestStore.store : Thread.current
      end
    end
  end
end

require 'adapters/http_log'
