class Category::Flickr < Category
  
  def refresh
    set_photos_from_flickr
  end
  
  def map_photos(photos)
    photos.each_with_index do |photo, i|
      flickr_photo_id = photo["id"]
      large_photo_url = Fetchers::Flickr::Photo.create_url_from_json(photo, "b")
      small_photo_url = Fetchers::Flickr::Photo.create_url_from_json(photo, "s")
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
end
