require 'rubygems'
require 'spork'

Spork.prefork do
  require 'simplecov'

  SimpleCov.start 'rails'

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  WebMock.disable_net_connect!

  RSpec.configure do |config|
    config.mock_with :rr

    config.before :each do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
end


