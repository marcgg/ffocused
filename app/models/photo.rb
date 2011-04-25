class Photo < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of :flickr_id, :scope => :category_id
end
