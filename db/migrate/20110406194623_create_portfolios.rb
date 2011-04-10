class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      t.text :description
      t.string :title
      t.text :footer
      t.string :flickr_user_name
      t.string :flickr_user_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :portfolios
  end
end
