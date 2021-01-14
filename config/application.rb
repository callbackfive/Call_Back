require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Callback
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = "zh-TW"
    config.time_zone = 'Taipei'
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }
  end
end
