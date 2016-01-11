Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Create Admin User for Production ENV:
# rake spree_auth:admin:create RAILS_ENV=production
