class User < ActiveRecord::Base
  acts_as_authentic
  has_one :portfolio
  after_create :setup_portfolio
  
  def setup_portfolio
    Portfolio.create!(:title => "My Portfolio", :description => "It is pretty great.", :user_id => id)
  end
end
