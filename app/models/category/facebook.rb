class Category::Facebook < Category
  after_create :set_photos_from_facebook
  
  def refresh
    set_photos_from_facebook
  end
  
  def set_photos_from_facebook
    graph = Koala::Facebook::GraphAPI.new
    res = graph.get_connections(facebook_album_id, "photos", :fields => "id,name,images", :limit => 200)
    res.each_with_index do |photo, i|
      logger.info "Saving photo #{i}"
      Photo.create(
        :position => i, 
        :facebook_photo_id => photo["id"],
        :large_photo_url => photo["images"].first["source"],
        :small_photo_url => photo["images"].last["source"],
        :category_id => self.id,
        :description => photo["name"],
        :title => photo["name"][0..50]
      )
    end
  end
  
end
