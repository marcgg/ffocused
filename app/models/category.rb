class Category < ActiveRecord::Base
  after_create :set_slug

  belongs_to :portfolio
  has_many :photos, :order => "position ASC"
  belongs_to :remote_account

  validates_uniqueness_of :slug, :scope => :portfolio_id, :if => Proc.new { |category| !category.new_record? }
  validates_presence_of :title
  validates_presence_of :slug, :if => Proc.new { |category| !category.new_record? }

  def set_slug
    unless self.slug
      self.update_attribute :slug, generated_slug
    end
  end

  def reset
    photos.destroy_all
    refresh
  end

  def generated_slug
    "#{self.id}-#{self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
  end
end
