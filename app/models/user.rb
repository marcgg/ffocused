class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.perishable_token_valid_for = 1.day
  end

  attr_protected :is_admin

  has_one :portfolio, :dependent => :destroy
  has_many :themes

  validate :check_beta_code, :on => :create

  after_create :setup_portfolio
  after_create :burn_beta_code

  validates_exclusion_of :login, :in => RESERVED_SLUGS

  def burn_beta_code
    code = BetaCode.where(:code => self.beta_code, :used => false).first
    code.update_attributes(:used => true)
  end

  def check_beta_code
    code = BetaCode.where(:code => self.beta_code, :used => false).first
    self.errors.add(:beta_code, I18n.t("users.check_beta_code.invalid")) if code.nil?
  end

  def setup_portfolio
    Portfolio.create!(:title => "#{login}'s Portfolio", 
                      :description => "This is my portfolio using ffocused, it's awesome.", 
                      :user_id => id, :slug => login)
  end

  def self.find_by_login_or_email(login)
     find_by_login(login) || find_by_email(login)
  end
end
