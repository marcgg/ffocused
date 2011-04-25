class Category < ActiveRecord::Base
  after_create :set_photos_from_flickr
  belongs_to :portfolio
  has_many :photos, :order => "position ASC"
  validates_uniqueness_of :slug, :scope => :portfolio_id
  
  def map_photos(photos)
    photos.map do |photo|
      flickr_photo_id = photo["id"]
      flickr_url_b = Flickr::Photo.create_url_from_json(photo, "b")
      flickr_url_s = Flickr::Photo.create_url_from_json(photo, "s")
      Photo.create!(  
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
