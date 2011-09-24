class Category::Flickr < Category
  after_create :set_photos_from_flickr

  def refresh
    set_photos_from_flickr
  end

  def set_photos_from_flickr
    res = Fetchers::Flickr::Request.call_method("photosets.getPhotos", {:photoset_id => flickr_set_id, :per_page => "100"})
    map_photos(res["photoset"]["photo"])
  end

  def map_photos(photos)
    photos.each_with_index do |photo, i|
      flickr_photo_id = photo["id"]
      large_photo_url, small_photo_url = find_photo_sizes(flickr_photo_id)
      Photo.create(
        :position => i,
        :flickr_photo_id => flickr_photo_id,
        :large_photo_url => large_photo_url,
        :small_photo_url => small_photo_url,
        :flickr_id => photo["id"],
        :category_id => self.id,
        :title => photo["title"]
      )
    end
  end

  def find_photo_sizes(flickr_photo_id)
    sizes = Fetchers::Flickr::Request.call_method("photos.getSizes", {:photo_id => flickr_photo_id})
    small_photo_url = sizes["sizes"]["size"].detect{|k,v| k["label"] == "Square"}["source"]
    large_data = sizes["sizes"]["size"].detect{|k,v| k["label"] == "Large"}
    large_data = sizes["sizes"]["size"].detect{|k,v| k["label"] == "Medium"} if large_data.nil?
    large_photo_url = large_data["source"]
    return large_photo_url, small_photo_url
  end
end
