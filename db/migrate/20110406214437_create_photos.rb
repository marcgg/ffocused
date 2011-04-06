class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :flickr_url_b
      t.string :flickr_url_s
      t.string :flickr_photo_id
      t.text :title
      t.text :description
      t.integer :category_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
