class Category::Flickr::FromTag < Category::Flickr
  def set_photos_from_flickr
    res = Fetchers::Flickr::Request.call_method("photos.search", {:user_id => portfolio.flickr_user_id, :tags => tags})
    map_photos(res["photos"]["photo"])
  end
end