class AddDestroyedToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :destroyed, :boolean, :destroyed => false
  end

  def self.down
    remove_column :photos, :destroyed
  end
end
