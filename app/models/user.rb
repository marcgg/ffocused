class User < ActiveRecord::Base
  acts_as_authentic
  attr_protected :is_admin
  
  has_one :portfolio, :dependent => :destroy
  has_many :themes
  
  validate :check_beta_code
  
  after_create :setup_portfolio
  after_create :burn_beta_code
  
  def burn_beta_code
    code = BetaCode.where(:code => self.beta_code, :used => false).first
    code.update_attributes(:used => true)
  end
  
  def check_beta_code
    code = BetaCode.where(:code => self.beta_code, :used => false).first
    self.errors.add(:beta_code, I18n.t("users.check_beta_code.invalid")) if code.nil?
  end
  
  def setup_portfolio
    # FIXME: Handle case where slug is already taken
    Portfolio.create!(:title => "#{login}'s Portfolio", :description => "This is my portfolio using Rlvnt, it's awesome.", :user_id => id, :slug => login)
  end
  
  def self.find_by_login_or_email(login)
     find_by_login(login) || find_by_email(login)
  end
end
