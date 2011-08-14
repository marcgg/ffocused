class RemoveFlickrSubmodels < ActiveRecord::Migration
  def self.up
    Category.update_all("type='Category::Flickr'", "type LIKE '%Category::Flickr%'")
  end

  def self.down
  end
end
