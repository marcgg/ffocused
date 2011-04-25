class AddTypeToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :type, :string
  end

  def self.down
    remove_column :categories, :type
  end
end
