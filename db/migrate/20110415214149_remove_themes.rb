class RemoveThemes < ActiveRecord::Migration
  def self.up
    drop_table :themes
  end

  def self.down
  end
end
