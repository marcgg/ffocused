class Category < ActiveRecord::Base
  after_create :set_photos_from_flickr
  after_create :set_slug
  belongs_to :portfolio
  has_many :photos, :order => "position ASC"
  validates_uniqueness_of :slug, :scope => :portfolio_id, :if => Proc.new { |category| !category.new_record? }
  
  def set_slug
    self.update_attribute(:slug, "#{self.id}-#{self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}")
  end
  
  def map_photos(photos)
    photos.each_with_index do |photo, i|
      flickr_photo_id = photo["id"]
      flickr_url_b = Flickr::Photo.create_url_from_json(photo, "b")
      flickr_url_s = Flickr::Photo.create_url_from_json(photo, "s")
      Photo.create(
        :position => i, 
        :flickr_photo_id => flickr_photo_id,
        :flickr_url_b => flickr_url_b,
        :flickr_url_s => flickr_url_s,
        :flickr_id => photo["id"],
        :category_id => self.id,
        :title => photo["title"]
      )
    end
  end
end
