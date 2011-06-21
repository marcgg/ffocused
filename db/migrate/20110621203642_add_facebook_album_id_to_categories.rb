class AddFacebookAlbumIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :facebook_album_id, :string
  end

  def self.down
    remove_column :categories, :facebook_album_id
  end
end
