Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.assets.js_compressor = :uglifier
  config.assets.digest = true
  config.serve_static_files = true
  config.assets.compile = false
  config.force_ssl = true
  config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.active_record.dump_schema_after_migration = false
  config.log_formatter = ::Logger::Formatter.new
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(Rails.root.join("log", Rails.env + ".log"), 7, 10457600))
  config.lograge.enabled = true

  config.action_mailer.smtp_settings = {
    address: "localhost",
    port: 1025,
    domain: Rails.application.secrets.domain_name
  }
  config.action_mailer.default_url_options = { :host => Rails.application.secrets.domain_name }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
end
