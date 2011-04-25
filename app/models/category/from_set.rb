class Category::FromSet < Category
  def set_photos_from_flickr
    res = Flickr::Request.call_method("photosets.getPhotos", {:photoset_id => flickr_set_id})
    map_photos(res["photoset"]["photo"])
  end
end