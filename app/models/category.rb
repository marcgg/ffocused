class Category < ActiveRecord::Base
  after_create :set_photos_from_flickr
  belongs_to :portfolio
  has_many :photos
  
  def set_photos_from_flickr
    res = Flickr::Request.call_method("photos.search", {:user_id => portfolio.flickr_user_id, :tags => tags})
    res["photos"]["photo"].map do |photo|
      flickr_photo_id = photo["id"]
      flickr_url_b = Flickr::Photo.create_url_from_json(photo, "b")
      flickr_url_s = Flickr::Photo.create_url_from_json(photo, "s")
      Photo.create!(  
        :flickr_photo_id => flickr_photo_id,
        :flickr_url_b => flickr_url_b,
        :flickr_url_s => flickr_url_s,
        :category_id => self.id
      )
    end
  end
end
