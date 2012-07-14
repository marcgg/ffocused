require "openssl"

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Prtfl::Application.initialize!

# Bypass some Facebook nonsense
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# ActionMailer config
ActionMailer::Base.smtp_settings = {
  :port           => SMTP_PORT, 
  :address        => SMTP_SERVER,
  :user_name      => SMTP_LOGIN,
  :password       => SMTP_PASSWORD,
  :domain         => DOMAIN,
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
