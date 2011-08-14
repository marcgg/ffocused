class AddDeletedToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :deleted, :boolean, :default => false
    remove_column :photos, :destroyed
  end

  def self.down
    remove_column :photos, :deleted
  end
end
