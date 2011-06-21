class ChangeCategoryTypes < ActiveRecord::Migration
  def self.up
    Category.update_all( "type = 'Category::Flickr::FromSet'", "type = 'Category::FromSet'" )
    Category.update_all( "type = 'Category::Flickr::FromTag'", "type = 'Category::FromTag'" )
  end

  def self.down
  end
end
