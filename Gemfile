source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_passwordx
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'omniauth', '~> 1.9', '>= 1.9.1'
gem 'omniauth-facebook', '~> 8.0'
gem "rails-i18n",'~> 6.0'
gem 'figaro', '~> 1.2'
gem 'carrierwave', '~> 2.1'
gem 'fog-aws', '~> 3.7'
gem 'mini_magick', '~> 4.11'
gem 'cancancan', '~> 1.15'
gem 'paranoia', '~> 2.4', '>= 2.4.3'
gem 'omniauth-google-oauth2', '~> 0.8.1'
gem 'koala', '~> 3.0'
gem 'ransack', '~> 2.4', '>= 2.4.1'
gem 'groupdate', '~> 5.2', '>= 5.2.1'
gem 'chartkick', '~> 3.4', '>= 3.4.2'
gem 'noticed', '~> 1.2', '>= 1.2.21'
gem 'friendly_id', '~> 5.4.2'
gem 'aws-sdk-s3', '~> 1.87', require: false
gem 'image_processing', '~> 1.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.15', '>= 2.15.1'
  gem 'bullet', '~> 6.1', '>= 6.1.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman', '~> 0.87.2'
  gem 'thor', '~> 1.0', '>= 1.0.1'
  gem 'hirb', '~> 0.7.3'
  # gem 'bullet', '~> 6.1', '>= 6.1.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
