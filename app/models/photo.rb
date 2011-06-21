class Photo < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of :flickr_id, :scope => :category_id, :if => Proc.new{|p| !p.flickr_id.blank?}
  validates_uniqueness_of :facebook_photo_id, :scope => :category_id, :if => Proc.new{|p| !p.facebook_photo_id.blank?}
end
