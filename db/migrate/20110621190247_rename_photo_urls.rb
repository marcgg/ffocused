class RenamePhotoUrls < ActiveRecord::Migration
  def self.up
    rename_column :photos, :flickr_url_b, :large_photo_url
    rename_column :photos, :flickr_url_s, :small_photo_url
  end

  def self.down
  end
end
