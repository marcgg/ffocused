class User < ActiveRecord::Base
  acts_as_authentic
  attr_protected :is_admin
  has_one :portfolio
  has_many :themes
  after_create :setup_portfolio
   
  def setup_portfolio
    Portfolio.create!(:title => "#{login}'s Portfolio", :description => "This is my portfolio using Rlvnt, it's awesome.", :user_id => id, :slug => login)
  end
  
  def self.find_by_login_or_email(login)
     find_by_login(login) || find_by_email(login)
  end
end
