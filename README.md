# Lograge::HttpRequest

Lograge::HttpRequest is an extension to the famous [Lograge](https://github.com/roidrage/lograge) gem, which adds HTTP requests to the Lograge Event and disable default ActiveRecord logging.
This is extremely useful if you're using Lograge together with the ELK stack.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lograge-http_request'
```

## Usage

In order to enable HTTP Request logging in your application, you'll simply need to add this on top of your lograge initializer:

```ruby
# config/initializers/lograge
require 'lograge/http_request/extension'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apra31/lograge-http_request.
