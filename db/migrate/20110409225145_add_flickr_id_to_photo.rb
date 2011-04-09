class AddFlickrIdToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :flickr_id, :text
  end

  def self.down
    remove_column :photos, :flickr_id
  end
end
