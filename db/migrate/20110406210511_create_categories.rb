class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :tags
      t.string :name
      t.text :description
      t.string :slug
      t.integer :position
      t.integer :portfolio_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
