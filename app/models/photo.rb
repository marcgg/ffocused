class Photo < ActiveRecord::Base
  belongs_to :category

  validates_uniqueness_of :flickr_id, :scope => :category_id, :if => Proc.new{|p| !p.flickr_id.blank?}
  validates_uniqueness_of :facebook_photo_id, :scope => :category_id, :if => Proc.new{|p| !p.facebook_photo_id.blank?}

  named_scope :activated, :conditions => {:deleted => false}
  named_scope :limited,   :limit => 15
  named_scope :ordered,   :order => "position DESC"

  def mark_as_destroyed
    update_attribute(:deleted, true)
  end
end
