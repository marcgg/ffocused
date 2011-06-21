class AddFacebookPhotoIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :facebook_photo_id, :string
  end

  def self.down
    remove_column :photos, :facebook_photo_id
  end
end
