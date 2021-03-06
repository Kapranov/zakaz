Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true

  config.action_mailer.smtp_settings = {
    address: "localhost",
    port: 1025,
    domain: Rails.application.secrets.domain_name
  }
  config.action_mailer.default_url_options = { :host => Rails.application.secrets.domain_name }
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.action_controller.include_all_helpers = true
end
