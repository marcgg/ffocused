class Portfolio < ActiveRecord::Base
  
  before_validation :set_slug
  
  validates_uniqueness_of :slug
  validates_presence_of :slug
  
  belongs_to :user
  has_many :remote_accounts, :dependent => :destroy
  has_many :categories, :order => "position ASC", :dependent => :destroy
  
  def set_slug
    self.slug = user.login if self.new_record?
  end
  
  def theme
    THEMES[theme_id]
  end
  
  def setup?
    !remote_accounts.empty?
  end
end
