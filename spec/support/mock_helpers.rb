def use_application_as(user, options={})
  any_instance_of(ApplicationController, :current_user => user)
  setup_portfolio(user.portfolio) if options[:setup_portfolio]
end

def setup_portfolio(portfolio)
  portfolio.remote_accounts << Fabricate(:remote_account)
end

def last_email
  ActionMailer::Base.deliveries.last
end