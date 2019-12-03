# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lograge/http_request/version'

Gem::Specification.new do |spec|
  spec.name          = 'lograge-http_request'
  spec.version       = Lograge::HttpRequest::VERSION
  spec.authors       = ['Aditya Pradiptadarma']
  spec.email         = ['a.pra31@gmail.com']

  spec.summary       = 'An extension for Lograge to log HTTP Requests'
  spec.description   = 'An extension for Lograge to log HTTP Requests'
  spec.homepage      = 'https://github.com/apra31/lograge-http_request'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httplog', '~> 1.3.3'
  spec.add_runtime_dependency 'lograge', '~> 0.4'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
