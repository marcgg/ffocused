class Category::Instagram < Category
  after_create :set_photos_from_instagram

  def refresh
    set_photos_from_instagram
  end

  def set_photos_from_instagram
    remote_account.photos.each_with_index do |photo, i|
      Photo.create(
        :position => i,
        :large_photo_url => photo["images"]["standard_resolution"]["url"],
        :small_photo_url => photo["images"]["thumbnail"]["url"],
        :category_id => self.id,
        :description => photo["filter"],
        :title => Time.at(photo["created_time"].to_i).strftime("%m/%d/%Y")
      )
    end
  end
end
