class RenameTags < ActiveRecord::Migration
  def self.up
    rename_column :categories, :tags, :flickr_tags
  end

  def self.down
    rename_column :categories, :flickr_tags, :tags
  end
end
