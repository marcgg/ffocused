config = YAML.load(File.open(File.join(Rails.root, "config", "social_accounts.yml")))
env_config = config[Rails.env]

if env_config["use_heroku"]
  puts "Loading Heroku variables"

  FLICKR_APPLICATION_API_KEY    = ENV["FLICKR_APPLICATION_API_KEY"]
  FLICKR_APPLICATION_SECRET     = ENV["FLICKR_APPLICATION_SECRET"]
  FACEBOOK_APPLICATION_ID       = ENV["FACEBOOK_APPLICATION_ID"]
  FACEBOOK_APPLICATION_SECRET   = ENV["FACEBOOK_APPLICATION_SECRET"]
  FACEBOOK_APPLICATION_API_KEY  = ENV["FACEBOOK_APPLICATION_API_KEY"]
  FACEBOOK_CALLBACK_URL         = ENV["FACEBOOK_CALLBACK_URL"]
  INSTAGRAM_CLIENT_ID           = ENV["INSTAGRAM_CLIENT_ID"]
  INSTAGRAM_CLIENT_SECRET       = ENV["INSTAGRAM_CLIENT_SECRET"]
  INSTAGRAM_CALLBACK_URL        = ENV["INSTAGRAM_CALLBACK_URL"]

elsif ENV['TRAVIS']
  # TODO: Research if there could be a better way
  puts "Loading fake variables for Travis CI"

  FLICKR_APPLICATION_API_KEY    = "flickr_api_key"
  FLICKR_APPLICATION_SECRET     = "flickr_secret"
  FACEBOOK_APPLICATION_ID       = "facebook_id"
  FACEBOOK_APPLICATION_SECRET   = "facebook_secret"
  FACEBOOK_APPLICATION_API_KEY  = "facebook_api_key"
  FACEBOOK_CALLBACK_URL         = "facebook_callback_url"
  INSTAGRAM_CLIENT_ID           = "instagram_id"
  INSTAGRAM_CLIENT_SECRET       = "instagram_secret"
  INSTAGRAM_CALLBACK_URL        = "instagram_callback_url"

else
  puts "Loading variables from social_accounts.yml"

  FLICKR_APPLICATION_API_KEY    = env_config["flickr"]["application_api_key"]
  FLICKR_APPLICATION_SECRET     = env_config["flickr"]["application_secret"]
  FACEBOOK_APPLICATION_ID       = env_config["facebook"]["application_id"]
  FACEBOOK_APPLICATION_SECRET   = env_config["facebook"]["application_secret"]
  FACEBOOK_APPLICATION_API_KEY  = env_config["facebook"]["application_api_key"]
  FACEBOOK_CALLBACK_URL         = env_config["facebook"]["callback_url"]
  INSTAGRAM_CLIENT_ID           = env_config["instagram"]["client_id"]
  INSTAGRAM_CLIENT_SECRET       = env_config["instagram"]["client_secret"]
  INSTAGRAM_CALLBACK_URL        = env_config["instagram"]["callback_url"]
end

Instagram.configure do |config|
  config.client_id = INSTAGRAM_CLIENT_ID
  config.client_secret = INSTAGRAM_CLIENT_SECRET
end
