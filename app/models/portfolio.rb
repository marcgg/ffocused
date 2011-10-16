class Portfolio < ActiveRecord::Base

  before_validation :set_slug, :set_default_css

  validates_uniqueness_of :slug
  validates_presence_of :slug
  validates_exclusion_of :slug, :in => RESERVED_SLUGS

  belongs_to :user

  has_many :remote_accounts, :dependent => :destroy
  has_many :categories, :order => "position ASC", :dependent => :destroy
  has_many :photos, :through => :categories

  def set_default_css
    self.theme_id = 1 if self.new_record?
  end

  def set_slug
    self.slug = user.login if self.new_record?
  end

  def theme
    THEMES[theme_id]
  end

  def setup?
    !remote_accounts.empty?
  end

  def contextual_photo(category=nil)
    if category
      photo = category.photos.first
    elsif categories.empty?
      photo = nil
    else
      photo = categories.first.photos.first
    end
    photo
  end

end
