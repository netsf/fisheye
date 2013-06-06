# Heroku-specific configuration options

Fisheye::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Using mailtrap since this heroku installation isn't actually one I care
  # about very much.
  if ENV['MAILTRAP_HOST'].present?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      :user_name => ENV['MAILTRAP_USER_NAME'],
      :password => ENV['MAILTRAP_PASSWORD'],
      :address => ENV['MAILTRAP_HOST'],
      :port => ENV['MAILTRAP_PORT'],
      :authentication => :plain
    }
  end
end