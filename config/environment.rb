require "openssl"

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Prtfl::Application.initialize!

# Bypass some Facebook nonsense
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

