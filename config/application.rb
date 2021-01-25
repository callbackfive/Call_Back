require_relative 'boot'
require 'rails/all'
require 'csv'


Bundler.require(*Rails.groups)

module Callback
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = "zh-TW"
    config.time_zone = 'Taipei'
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }
    <?xml version="1.0" encoding="UTF-8"?>
    <CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>https://example.com</AllowedOrigin>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <MaxAgeSeconds>3600</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
    </CORSConfiguration>
  end
end
