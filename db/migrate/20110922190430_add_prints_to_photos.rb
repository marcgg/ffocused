class AddPrintsToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :prints, :integer, :default => 0
  end

  def self.down
    remove_column :photos, :prints
  end
end
