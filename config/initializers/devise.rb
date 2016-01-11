Devise.setup do |config|
  require 'devise/orm/active_record'
  config.secret_key = Rails.application.secrets.devise_secret_key
  config.mailer_sender = 'no-reply@' + Rails.application.secrets.domain_name
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 4..12
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.timeout_in = 10.minutes
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
