class AddFlickrSetIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :flickr_set_id, :string
  end

  def self.down
    remove_column :categories, :flickr_set_id
  end
end
