class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.text :css
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :themes
  end
end
