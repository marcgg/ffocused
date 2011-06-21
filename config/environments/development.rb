Prtfl::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  # Flickr
  FLICKR_APPLICATION_API_KEY = "15308080fe510399d83e2b185ed1a073"
  FLICKR_APPLICATION_SECRET = "b5608a4e7f6512da"
  
  # Facebook
  FACEBOOK_APPLICATION_ID = "212399708799450"
  FACEBOOK_APPLICATION_SECRET = "6d6be8c09cbee1399a53ae3b8b816ee9"
  FACEBOOK_APPLICATION_API_KEY = "062d0279e6bc49e9bd0dcef8055b0eca"
  FACEBOOK_ACCESS_TOKEN = "2227470867|2.AQDfkS7iH5DtezoM.3600.1308693600.0-560289256|MdaysY4jFnreqvBJW2gn-6xJsk4"

end

