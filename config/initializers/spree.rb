Spree.config do |config|
  #
end

SpreeI18n::Config.available_locales = [:uk, :ru, :en]
SpreeI18n::Config.supported_locales = [:uk, :ru, :en]
Spree.user_class = "Spree::User"
