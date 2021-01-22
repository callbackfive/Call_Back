Rails.application.configure do

  # config.after_initialize do
  #   Bullet.enable        = true
  #   Bullet.alert         = true
  #   Bullet.bullet_logger = true
  #   Bullet.console       = true
  #   Bullet.growl         = true
  #   Bullet.rails_logger  = true
  #   Bullet.add_footer    = true
  # end

  config.hosts << "326fe47559f9.ngrok.io"
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
 
  config.action_mailer.default_url_options = { host: 'localhost', port: 3001 }
  config.action_mailer.perform_deliveries = true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 587,
    domain: '127.0.0.1',
    user_name: 'postmaster@sandboxa0ec803b397d4f85915750f27860f6af.mailgun.org',
    password: ENV['mailgun_password'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end

