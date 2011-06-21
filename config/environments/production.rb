Prtfl::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = false

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  # Flickr
  FLICKR_APPLICATION_API_KEY = "15308080fe510399d83e2b185ed1a073"
  FLICKR_APPLICATION_SECRET = "b5608a4e7f6512da"
  
  # Facebook
  FACEBOOK_APPLICATION_ID = "212399708799450"
  FACEBOOK_APPLICATION_SECRET = "6d6be8c09cbee1399a53ae3b8b816ee9"
  FACEBOOK_APPLICATION_API_KEY = "062d0279e6bc49e9bd0dcef8055b0eca"
  FACEBOOK_ACCESS_TOKEN = "2227470867|2.AQDfkS7iH5DtezoM.3600.1308693600.0-560289256|MdaysY4jFnreqvBJW2gn-6xJsk4"
  
end
